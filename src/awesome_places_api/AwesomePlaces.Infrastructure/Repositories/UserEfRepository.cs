using AwesomePlaces.Core.Entities.Identity;
using AwesomePlaces.Core.Repositories;
using AwesomePlaces.Infrastructure.Persistance;
using Microsoft.EntityFrameworkCore;

namespace AwesomePlaces.Infrastructure.Repositories;
public class UserEfRepository : IUserRepository
{
    private readonly PlaceEfContext _placeEfContext;

    public UserEfRepository(PlaceEfContext placeEfContext)
    {
        _placeEfContext = placeEfContext;
    }

    public async Task<Guid> CreateAsync(User user)
    {
        await _placeEfContext.Users.AddAsync(user);
        await _placeEfContext.SaveChangesAsync();
        return user.Id;
    }

    public async Task<User?> GetAsync(string email)
    {
        var dbUser = await _placeEfContext.Users
                //.Include(dbUser => dbUser.Role)
                .FirstOrDefaultAsync(dbUser => dbUser.Email == email);
        return dbUser;
    }
}
