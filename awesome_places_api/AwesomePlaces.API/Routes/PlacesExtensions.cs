using System.Runtime.CompilerServices;

namespace AwesomePlaces.API.Routes;

public static class PlacesExtensions
{
    public static RouteGroupBuilder MapPlaces(this RouteGroupBuilder routeGroupBuilder)
    {
        routeGroupBuilder.MapGet("hello", (HttpContext context) =>
        {
            return "Hello World!";
        })
        .WithName("GetPlaces")
        .WithOpenApi();

        routeGroupBuilder.MapPost("hello", () => { });
        return routeGroupBuilder;
    }
}
