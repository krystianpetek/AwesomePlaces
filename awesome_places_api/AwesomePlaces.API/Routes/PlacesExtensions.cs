using Microsoft.AspNetCore.Mvc;

namespace AwesomePlaces.Api.Routes;

public static class PlacesExtensions
{
    public static RouteGroupBuilder MapPlaces(this RouteGroupBuilder routeGroupBuilder)
    {
        routeGroupBuilder.MapGet("hello", (/*[FromServices]*/ HttpContext context) =>
        {
            return "Hello World!";
        })
        .WithName("GetPlaces")
        .WithOpenApi();
        //.RequireAuthorization();

        routeGroupBuilder.MapPost("hello", () => { });
        return routeGroupBuilder;
    }
}
// https://learn.microsoft.com/en-us/aspnet/core/fundamentals/minimal-apis/parameter-binding?view=aspnetcore-7.0 - minimal api

// https://stackoverflow.com/questions/3548401/how-to-save-image-in-database-using-c-sharp - save image using dapper in bytes