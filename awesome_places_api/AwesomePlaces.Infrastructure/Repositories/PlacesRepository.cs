using AwesomePlaces.Core.Entities;
using AwesomePlaces.Core.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AwesomePlaces.Infrastructure.Repositories;
public class PlacesRepository : IPlacesRepository
{
    public Task AddAsync(Place place)
    {
        throw new NotImplementedException();
    }

    public Task DeleteAsync(Place place)
    {
        throw new NotImplementedException();
    }

    public Task<IReadOnlyList<Place>> GetAllAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public Task<Place> GetAsync(Guid id)
    {
        throw new NotImplementedException();
    }

    public Task UpdateAsync(Place place)
    {
        throw new NotImplementedException();
    }
}
