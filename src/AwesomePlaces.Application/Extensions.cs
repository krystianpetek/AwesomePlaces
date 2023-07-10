using AwesomePlaces.Application.Interfaces;
using AwesomePlaces.Application.Services;
using AwesomePlaces.Core.Entities.Identity;
using AwesomePlaces.Core.Services;
using FluentValidation;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using System.Reflection;

namespace AwesomePlaces.Application;
public static class Extensions
{
	public static IServiceCollection AddApplicationServices(this IServiceCollection services)
	{
		services.AddScoped<IPasswordHasher<User>, PasswordHasher<User>>();
		services.AddScoped<IPlaceService, PlaceService>();

		services.AddScoped<IUserService, UserService>();
		services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());
		return services;
	}
}
