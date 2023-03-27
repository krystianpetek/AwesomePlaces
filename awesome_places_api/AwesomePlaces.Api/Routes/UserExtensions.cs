using AwesomePlaces.Api.Helpers;
using AwesomePlaces.Application.Interfaces;
using AwesomePlaces.Application.Models;
using Microsoft.AspNetCore.Mvc;

namespace AwesomePlaces.Api.Routes;

public static class UserExtensions
{
    public static RouteGroupBuilder MapUsers(this RouteGroupBuilder routeGroupBuilder)
    {
        routeGroupBuilder.MapPost("register", async (
            [FromBody] RegisterUserModel registerUserModel,
            [FromServices] IUserService usersService,
            HttpContext context) =>
        {
            await usersService.RegisterUser(registerUserModel);
            return Results.Ok();

        })
        .AddEndpointFilterFactory((context, next) =>
        {
            if (context.MethodInfo.GetParameters().Any(p => p.ParameterType == typeof(RegisterUserModel)))
            {
                var filter = new ValidationFilter<RegisterUserModel>();
                return invocationContext => filter.InvokeAsync(invocationContext, next);
            }

            return invocationContext => next(invocationContext);
        })
        .WithName("RegisterUser")
        .WithOpenApi();

        routeGroupBuilder.MapPost("login", async (
            [FromBody] LoginUserModel loginUserModel,
            [FromServices] IUserService usersService,
            HttpContext context) =>
        {
            string token = await usersService.LoginGenerateJwt(loginUserModel);
            return Results.Ok(token);
        })
        .AddEndpointFilterFactory((context, next) =>
        {
            if (context.MethodInfo.GetParameters().Any(p => p.ParameterType == typeof(LoginUserModel)))
            {
                var filter = new ValidationFilter<LoginUserModel>();
                return invocationContext => filter.InvokeAsync(invocationContext, next);
            }

            return invocationContext => next(invocationContext);
        })
        .WithName("LoginUser")
        .WithOpenApi();

        return routeGroupBuilder;
    }
}
