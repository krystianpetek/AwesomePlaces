using AwesomePlaces.Application.Interfaces;
using AwesomePlaces.Core.Repositories;

namespace AwesomePlaces.Infrastructure.Services;
public class PlaceService : IPlaceService
{
    private readonly IPlaceRepository _placeRepository;
    public PlaceService(IPlaceRepository placeRepository)
    {
        _placeRepository = placeRepository;
    }
}
