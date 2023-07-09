using AwesomePlaces.Core.Entities;
using AwesomePlaces.Core.Exceptions;
using AwesomePlaces.Core.Repositories;
using AwesomePlaces.Core.Services;

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
		Place place = await _placeRepository.GetAsync(id) ?? throw new NotFoundException("Place not found.");
		return place;
	}

	public async Task<IEnumerable<Place>> GetPlaces()
	{
		return await _placeRepository.GetCollectionAsync();
	}
}
