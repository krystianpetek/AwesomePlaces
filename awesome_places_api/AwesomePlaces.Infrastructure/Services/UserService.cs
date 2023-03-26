using AwesomePlaces.Application.Interfaces;
using AwesomePlaces.Application.Models;
using AwesomePlaces.Core.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AwesomePlaces.Infrastructure.Services;
public class UserService : IUserService
{
    private readonly IUserRepository _userRepository;

    public UserService(IUserRepository userRepository)
    {
        _userRepository = userRepository;
    }

    public Task<string> LoginGenerateJwt(LoginUserModel loginModel)
    {
        throw new NotImplementedException();
    }

    public Task RegisterUser(RegisterUserModel registerUserModel)
    {
        throw new NotImplementedException();
    }
}
