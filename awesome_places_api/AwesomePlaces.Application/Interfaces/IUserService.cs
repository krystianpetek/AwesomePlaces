using AwesomePlaces.Application.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AwesomePlaces.Application.Interfaces;
public interface IUserService
{
    Task RegisterUser(RegisterUserModel registerUserModel);
    Task<string> LoginGenerateJwt(LoginUserModel loginModel);
}
