using AwesomePlaces.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AwesomePlaces.Application.Interfaces;
public interface IPlaceService
{
    Task<IEnumerable<Place>> GetPlaces();
    Task<Place> GetPlace(Guid id);
    Task<Guid> CreatePlace(Place place);
}
