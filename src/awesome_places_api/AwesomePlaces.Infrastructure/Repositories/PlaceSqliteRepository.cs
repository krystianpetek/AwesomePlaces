using AwesomePlaces.Core.Entities;
using AwesomePlaces.Core.Repositories;
using AwesomePlaces.Infrastructure.Persistance;
using Dapper;
using System.Data;

namespace AwesomePlaces.Infrastructure.Repositories;
public class PlaceSqliteRepository : IPlaceRepository
{
    private readonly PlaceSqliteContext _placeContext;
    public PlaceSqliteRepository(PlaceSqliteContext placeContext)
    {
        _placeContext = placeContext;
    }

    public async Task<IEnumerable<Place>> GetCollectionAsync()
    {
        using IDbConnection connection = _placeContext.CreateConnection();
        string sql = """
            SELECT * FROM Users
        """;
        return await connection.QueryAsync<Place>(sql);
    }

    public async Task<Place> GetAsync(Guid id)
    {
        using IDbConnection connection = _placeContext.CreateConnection();
        string sql = """
            SELECT * FROM Places WHERE Id = @id
            """;
        return await connection.QuerySingleOrDefaultAsync(sql);
    }

    public async Task<Guid> CreateAsync(Place place)
    {
        using IDbConnection connection = _placeContext.CreateConnection();
        var sql = """
            INSERT INTO Places (Id, Name, Description, PlaceType, Coordinate, Address, Image, Rating, RequiredFee) 
            VALUES (@Id, @Name, @Description, @PlaceType, @Coordinate, @Address, @Image, @Rating, @RequiredFee) 
            """;
        await connection.ExecuteAsync(sql);

        return place.Id;
    }

    public async Task DeleteAsync(Guid id)
    {
        using IDbConnection connection = _placeContext.CreateConnection();
        var sql = """
            DELETE FROM Places
            WHERE Id = @id
            """;
        await connection.ExecuteAsync(sql, new { id });
    }

    public async Task UpdateAsync(Place place)
    {
        using IDbConnection connection = _placeContext.CreateConnection();
        var sql = """
            UPDATE Places
            SET Id = @Id, 
                Name = @Name, 
                Description = @Description, 
                PlaceType = @PlaceType, 
                Coordinate = @Coordinate,
                Address = @Address,
                Image = @Image,
                Rating = @Rating,
                RequiredFee = @RequiredFee
            WHERE Id = @Id
            """;
        await connection.ExecuteAsync(sql, place);
    }
}
