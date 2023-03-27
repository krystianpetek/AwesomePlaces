using AwesomePlaces.Api.Middleware;
using AwesomePlaces.Api.Routes;
using AwesomePlaces.Application;
using AwesomePlaces.Infrastructure;
using AwesomePlaces.Infrastructure.Persistance;
using FluentValidation;
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
        builder.Services.ConfigureSwaggerGen(swaggerGenOptions =>
            {
                swaggerGenOptions.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "Awesome Places API",
                    Version = "v1"
                });
                var jwtSecurityScheme = new OpenApiSecurityScheme
                {
                    BearerFormat = "JWT",
                    Name = "JWT Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.Http,
                    Scheme = JwtBearerDefaults.AuthenticationScheme,
                    Description = "Put you JWT Bearer token in Authorize section. **_Only Token!_**",
                    Reference = new OpenApiReference
                    {
                        Id = JwtBearerDefaults.AuthenticationScheme,
                        Type = ReferenceType.SecurityScheme
                    }
                };

                swaggerGenOptions.AddSecurityDefinition(jwtSecurityScheme.Reference.Id, jwtSecurityScheme);
                swaggerGenOptions.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                    { 
                        jwtSecurityScheme, 
                        Array.Empty<string>() 
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