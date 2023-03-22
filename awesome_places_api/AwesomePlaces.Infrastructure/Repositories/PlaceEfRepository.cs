using AwesomePlaces.Core.Entities;
using AwesomePlaces.Core.Repositories;
using AwesomePlaces.Infrastructure.Persistance;
using Dapper;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace AwesomePlaces.Infrastructure.Repositories;
public class PlaceEfRepository : IPlaceRepository
{
    private readonly PlaceDbContext _placeDbContext;

    public PlaceEfRepository(PlaceDbContext placeDbContext)
    {
        _placeDbContext = placeDbContext;
    }

    public async Task AddAsync(Place place)
    {
        ArgumentNullException.ThrowIfNull(place, nameof(place));

        _placeDbContext.Places.Add(place);
        await _placeDbContext.SaveChangesAsync();
    }

    public async Task DeleteAsync(Guid id)
    {
        var place = await _placeDbContext.Places.FirstOrDefaultAsync(place => place.Id == id);
        ArgumentNullException.ThrowIfNull(place, nameof(place));

        _placeDbContext.Places.Remove(place);
        await _placeDbContext.SaveChangesAsync();
    }

    public async Task<IEnumerable<Place>> GetAllAsync(Guid id)
    {
        return await _placeDbContext.Places.ToListAsync();
    }

    public async Task<Place> GetAsync(Guid id)
    {
        return await _placeDbContext.Places.SingleOrDefaultAsync(place => place.Id == id);
    }

    public async Task UpdateAsync(Place place)
    {
        ArgumentNullException.ThrowIfNull(place);
        _placeDbContext.Places.Update(place);
        await _placeDbContext.SaveChangesAsync();
    }
}
