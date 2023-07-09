using FluentValidation;

namespace AwesomePlaces.Application.Models.Validators;
public class LoginUserModelValidator : AbstractValidator<LoginUserModel>
{
	public LoginUserModelValidator()
	{
		RuleFor(m => m.Email).EmailAddress();
		RuleFor(m => m.Password).NotNull().NotEmpty().MinimumLength(8);
	}
}
