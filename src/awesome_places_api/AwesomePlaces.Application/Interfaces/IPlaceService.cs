using AwesomePlaces.Core.Entities;

namespace AwesomePlaces.Application.Interfaces;
public interface IPlaceService
{
    Task<IEnumerable<Place>> GetPlaces();
    Task<Place> GetPlace(Guid id);
    Task<Guid> CreatePlace(Place place);
}
