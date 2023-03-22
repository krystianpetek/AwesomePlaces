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

        routeGroupBuilder.MapPost("hello", () => { });
        return routeGroupBuilder;
    }
}
