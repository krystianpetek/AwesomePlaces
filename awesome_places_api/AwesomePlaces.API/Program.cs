using AwesomePlaces.Api.Routes;

namespace AwesomePlaces.Api;

public static class Program
{
    public static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        builder.Services.AddAuthorization();

        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen();

        var app = builder.Build();

        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI();
        }

        app.UseHttpsRedirection();

        app.UseAuthorization();

        app.MapGroup("places").MapPlaces();

        app.Run();
    }
}

// https://github.com/devmentors/Pacco

// https://github.com/devmentors/Pacco.Services.Vehicles

// https://github.com/orgs/devmentors/repositories?q=pacco&type=all&language=&sort=