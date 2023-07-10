using AwesomePlaces.Application.Interfaces;
using AwesomePlaces.Application.Models;
using AwesomePlaces.Core.Entities.Identity;
using AwesomePlaces.Core.Exceptions;
using AwesomePlaces.Core.Repositories;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace AwesomePlaces.Application.Services;
public class UserService : IUserService
{
	private readonly IUserRepository _userRepository;
	private readonly IPasswordHasher<User> _passwordHasher;
	private readonly AuthenticationSettings _authenticationSettings;

	public UserService(IUserRepository userRepository, IPasswordHasher<User> passwordHasher, AuthenticationSettings authenticationSettings)
	{
		_userRepository = userRepository;
		_passwordHasher = passwordHasher;
		_authenticationSettings = authenticationSettings;
	}

	public async Task<string> LoginGenerateJwt(LoginUserModel loginModel)
	{
		User user = await _userRepository.GetAsync(loginModel.Email) ?? throw new BadRequestException("Invalid username or password!");

		PasswordVerificationResult result = _passwordHasher.VerifyHashedPassword(user, user.PasswordHash, loginModel.Password);
		if (result == PasswordVerificationResult.Failed)
			throw new BadRequestException("Invalid username or password!");

		List<Claim> claims = new List<Claim>
		{
			new Claim(ClaimTypes.NameIdentifier, $"{user.Id}"),
			new Claim(ClaimTypes.Email, $"{user.Email}"),
			new Claim(ClaimTypes.Role, $"{user.Role}"),
		};

		SymmetricSecurityKey key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_authenticationSettings.JwtKey));
		SigningCredentials credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
		DateTime expires = DateTime.Now.AddDays(_authenticationSettings.JwtExpireDays);

		JwtSecurityToken token = new JwtSecurityToken(
			issuer: _authenticationSettings.JwtIssuer,
			audience: _authenticationSettings.JwtIssuer,
			claims: claims,
			expires: expires,
			signingCredentials: credentials);

		JwtSecurityTokenHandler tokenHandler = new JwtSecurityTokenHandler();
		return tokenHandler.WriteToken(token);
	}

	public async Task RegisterUser(RegisterUserModel registerUserModel)
	{
		User newUser = new User
		{
			Email = registerUserModel.Email,
			RoleId = registerUserModel.RoleId,
		};

		string hashedPassword = _passwordHasher.HashPassword(newUser, registerUserModel.Password);
		newUser.PasswordHash = hashedPassword;

		await _userRepository.CreateAsync(newUser);
	}
}
