using AwesomePlaces.Application.Interfaces;
using AwesomePlaces.Core.Entities;
using AwesomePlaces.Core.Repositories;

namespace AwesomePlaces.Infrastructure.Services;
public class PlaceService : IPlaceService
{
    private readonly IPlaceRepository _placeRepository;
    public PlaceService(IPlaceRepository placeRepository)
    {
        _placeRepository = placeRepository;
    }

    public async Task<Guid> CreatePlace(Place place)
    {
        return await _placeRepository.CreateAsync(place);
    }

    public async Task<Place> GetPlace(Guid id)
    {
        return await _placeRepository.GetAsync(id);

    }

    public async Task<IEnumerable<Place>> GetPlaces()
    {
        return await _placeRepository.GetCollectionAsync();
    }
}
