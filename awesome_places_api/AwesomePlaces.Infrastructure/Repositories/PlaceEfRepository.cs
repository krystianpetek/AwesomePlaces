using AwesomePlaces.Core.Entities;
using AwesomePlaces.Core.Repositories;
using AwesomePlaces.Infrastructure.Persistance;
using Microsoft.EntityFrameworkCore;

namespace AwesomePlaces.Infrastructure.Repositories;
public class PlaceEfRepository : IPlaceRepository
{
    private readonly PlaceEfContext _placeDbContext;

    public PlaceEfRepository(PlaceEfContext placeDbContext)
    {
        _placeDbContext = placeDbContext;
    }

    public async Task<Guid> CreateAsync(Place place)
    {
        ArgumentNullException.ThrowIfNull(place, nameof(place));

        _placeDbContext.Places.Add(place);
        await _placeDbContext.SaveChangesAsync();

        return place.Id;
    }

    public async Task DeleteAsync(Guid id)
    {
        var place = await _placeDbContext.Places.FirstOrDefaultAsync(place => place.Id == id);
        ArgumentNullException.ThrowIfNull(place, nameof(place));

        _placeDbContext.Places.Remove(place);
        await _placeDbContext.SaveChangesAsync();
    }

    public async Task<IEnumerable<Place>> GetCollectionAsync()
    {
        return await _placeDbContext.Places
            .Include(coordinate => coordinate.Coordinate)
            .Include(address => address.Address)
            .ToListAsync();
    }

    public async Task<Place> GetAsync(Guid id)
    {
        return await _placeDbContext.Places
                    .Include(coordinate => coordinate.Coordinate)
                    .Include(address => address.Address)
                    .SingleOrDefaultAsync(place => place.Id == id);
    }

    public async Task UpdateAsync(Place place)
    {
        ArgumentNullException.ThrowIfNull(place);
        _placeDbContext.Places.Update(place);
        await _placeDbContext.SaveChangesAsync();
    }
}
