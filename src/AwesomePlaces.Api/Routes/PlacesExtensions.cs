using AwesomePlaces.Core.Entities;
using AwesomePlaces.Core.Services;
using Microsoft.AspNetCore.Mvc;

namespace AwesomePlaces.Api.Routes;

public static class PlacesExtensions
{
	public static RouteGroupBuilder MapPlaces(this RouteGroupBuilder routeGroupBuilder)
	{
		routeGroupBuilder.MapGet("/{id}", async ([FromQuery] Guid id, [FromServices] IPlaceService placeService, HttpContext context) =>
		{
			Place place = await placeService.GetPlace(id);
			await context.Response.WriteAsJsonAsync<Place>(place);
		})
		.WithName("GetPlace")
		.WithOpenApi()
		.RequireAuthorization();

		routeGroupBuilder.MapGet("/", async ([FromServices] IPlaceService placeService, HttpContext context) =>
		{
			IEnumerable<Place> places = await placeService.GetPlaces();
			await context.Response.WriteAsJsonAsync<IEnumerable<Place>>(places);

		})
		.WithName("GetPlaces")
		.WithOpenApi()
		.RequireAuthorization();

		routeGroupBuilder.MapPost("", async ([FromBody] Place place, [FromServices] IPlaceService placeService, HttpContext httpContext) =>
		{
			await placeService.CreatePlace(place);
		})
		.WithName("CreatePlace")
		.WithOpenApi()
		.RequireAuthorization();

		return routeGroupBuilder;
	}
}
// https://learn.microsoft.com/en-us/aspnet/core/fundamentals/minimal-apis/parameter-binding?view=aspnetcore-7.0 - minimal api