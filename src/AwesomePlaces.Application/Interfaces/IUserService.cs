using AwesomePlaces.Application.Models;

namespace AwesomePlaces.Application.Interfaces;
public interface IUserService
{
	Task RegisterUser(RegisterUserModel registerUserModel);
	Task<string> LoginGenerateJwt(LoginUserModel loginModel);
}
