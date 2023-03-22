using AwesomePlaces.Api.Routes;
using AwesomePlaces.Application;
using AwesomePlaces.Infrastructure;
using AwesomePlaces.Infrastructure.Persistance;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
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


        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen();

        builder.Services.AddInfrastructureServices(builder.Configuration);
        builder.Services.AddApplicationServices();

        var app = builder.Build();

        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI();
        }

        app.UseHttpsRedirection();

        app.UseAuthentication();
        app.UseAuthorization();

        app.MapGroup("places").MapPlaces();

        await app.PlaceEfSeed();
        app.Run();
    }
}

// https://github.com/devmentors/Pacco

// https://github.com/devmentors/Pacco.Services.Vehicles

// https://github.com/orgs/devmentors/repositories?q=pacco&type=all&language=&sort=