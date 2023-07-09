using AwesomePlaces.Core.Entities.Identity;

namespace AwesomePlaces.Core.Repositories;
public interface IUserRepository
{
	Task<User?> GetAsync(string email);
	Task<Guid> CreateAsync(User user);
}
