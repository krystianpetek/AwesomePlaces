using AwesomePlaces.Core.Entities;

namespace AwesomePlaces.Core.Repositories;

public interface IPlaceRepository
{
    Task<IEnumerable<Place>> GetAllAsync(Guid id);
    Task<Place> GetAsync(Guid id);
    Task AddAsync(Place place);
    Task UpdateAsync(Place place);
    Task DeleteAsync(Guid id);
}