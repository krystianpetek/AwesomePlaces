using AwesomePlaces.Core.Entities;

namespace AwesomePlaces.Core.Repositories;

public interface IPlaceRepository
{
    Task<IEnumerable<Place>> GetCollectionAsync();
    Task<Place> GetAsync(Guid id);
    Task<Guid> CreateAsync(Place place);
    Task UpdateAsync(Place place);
    Task DeleteAsync(Guid id);
}