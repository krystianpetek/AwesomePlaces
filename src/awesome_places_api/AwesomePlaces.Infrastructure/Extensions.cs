
using AwesomePlaces.Application.Interfaces;
using AwesomePlaces.Core.Entities.Identity;
using AwesomePlaces.Core.Repositories;
using AwesomePlaces.Infrastructure.Persistance;
using AwesomePlaces.Infrastructure.Repositories;
using AwesomePlaces.Infrastructure.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace AwesomePlaces.Infrastructure;
public static class Extensions
{
    public static IServiceCollection AddInfrastructureServices(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<PlaceEfContext>(options => options.UseInMemoryDatabase("PlaceDb"));
        services.AddScoped<IPlaceRepository, PlaceEfRepository>();
        services.AddScoped<IPlaceService, PlaceService>();

        services.AddScoped<IPasswordHasher<User>, PasswordHasher<User>>();
        services.AddScoped<IUserRepository, UserEfRepository>();
        services.AddScoped<IUserService, UserService>();
        return services;
    }
}
