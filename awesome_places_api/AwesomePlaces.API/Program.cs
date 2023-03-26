using AwesomePlaces.Api.Middleware;
using AwesomePlaces.Api.Routes;
using AwesomePlaces.Application;
using AwesomePlaces.Infrastructure;
using AwesomePlaces.Infrastructure.Persistance;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;

namespace AwesomePlaces.Api;

public static class Program
{
    public static async Task Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        AuthenticationSettings? authenticationSettings = builder.Configuration.GetRequiredSection("AuthenticationSettings").Get<AuthenticationSettings>();

        builder.Services.AddAuthorization();
        builder.Services
            .AddAuthentication((AuthenticationOptions authenticationOptions) =>
            {
                authenticationOptions.DefaultAuthenticateScheme = "Bearer";
                authenticationOptions.DefaultScheme = "Bearer";
                authenticationOptions.DefaultChallengeScheme = "Bearer";
            })
            .AddJwtBearer((JwtBearerOptions jwtBearerOptions) =>
            {
                jwtBearerOptions.RequireHttpsMetadata = false;
                jwtBearerOptions.SaveToken = true;
                jwtBearerOptions.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = authenticationSettings!.JwtIssuer,
                    ValidAudience = authenticationSettings!.JwtIssuer,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(authenticationSettings!.JwtKey)),
                };
            });
        builder.Services.ConfigureSwaggerGen(setup =>
            {
                setup.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "Awesome Places API",
                    Version = "v1"
                });
                setup.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme.
                    First fetch register, next login and in response you get JWT Token.
                    Token pass in Authorize section like this example: 'Bearer {token}'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                setup.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference
                            {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                            },
                            Scheme = "oauth2",
                            Name = "Bearer",
                            In = ParameterLocation.Header,
                        },
                        new List<string>()
                    }
                });
            });

        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen();

        builder.Services.AddScoped<ErrorHandlingMiddleware>();

        builder.Services.AddSingleton<AuthenticationSettings>(authenticationSettings);
        builder.Services.AddInfrastructureServices(builder.Configuration);
        builder.Services.AddApplicationServices();

        var app = builder.Build();

        app.UseSwagger();
        app.UseSwaggerUI();

        app.UseHttpsRedirection();

        app.UseAuthentication();
        app.UseAuthorization();

        app.UseMiddleware<ErrorHandlingMiddleware>();

        app.MapGroup("users").MapUsers();
        app.MapGroup("places").MapPlaces();

        await app.PlaceEfSeed();
        app.Run();
    }
}

// https://github.com/devmentors/Pacco

// https://github.com/devmentors/Pacco.Services.Vehicles

// https://github.com/orgs/devmentors/repositories?q=pacco&type=all&language=&sort=