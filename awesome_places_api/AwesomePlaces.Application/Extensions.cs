using FluentValidation;
using Microsoft.Extensions.DependencyInjection;
using System.Reflection;

namespace AwesomePlaces.Application;
public static class Extensions
{
    public static IServiceCollection AddApplicationServices(this IServiceCollection services)
    {
        services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());
        return services;
    }
}
