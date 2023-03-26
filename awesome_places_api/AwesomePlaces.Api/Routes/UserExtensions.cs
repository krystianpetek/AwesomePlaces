using AwesomePlaces.Application.Interfaces;
using AwesomePlaces.Application.Models;
using AwesomePlaces.Core.Entities;
using Microsoft.AspNetCore.Mvc;

namespace AwesomePlaces.Api.Routes;

public static class UserExtensions
{
    public static RouteGroupBuilder MapUsers(this RouteGroupBuilder routeGroupBuilder)
    {
        routeGroupBuilder.MapPost("register", async ([FromServices] IUserService usersService, [FromBody] RegisterUserModel registerUserModel, HttpContext context) =>
        {
            await usersService.RegisterUser(registerUserModel);
            return Results.Ok();

        })
        .WithName("RegisterUser")
        .WithOpenApi();

        routeGroupBuilder.MapPost("login", async ([FromServices] IUserService usersService, [FromBody] LoginUserModel loginUserModel, HttpContext context) =>
        {
            string token = await usersService.LoginGenerateJwt(loginUserModel);
            return Results.Ok(token);
        });

        return routeGroupBuilder;
    }
}
