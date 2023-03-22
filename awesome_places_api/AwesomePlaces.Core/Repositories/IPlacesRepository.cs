using AwesomePlaces.Core.Entities;

namespace AwesomePlaces.Core.Repositories;

public interface IPlacesRepository
{
    Task<IReadOnlyList<Place>> GetAllAsync(Guid id);
    Task<Place> GetAsync(Guid id);
    Task AddAsync(Place place);
    Task UpdateAsync(Place place);
    Task DeleteAsync(Place place);
}