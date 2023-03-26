using AwesomePlaces.Core.Entities;
using AwesomePlaces.Core.Entities.Identity;

namespace AwesomePlaces.Core.Repositories;
public interface IUserRepository
{
    Task<User> GetAsync(User loginUserModel);
    Task<Guid> CreateAsync(User place);
}
