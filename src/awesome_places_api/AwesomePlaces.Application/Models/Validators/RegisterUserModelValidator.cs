using FluentValidation;

namespace AwesomePlaces.Application.Models.Validators;
public class RegisterUserModelValidator : AbstractValidator<RegisterUserModel>
{
    public RegisterUserModelValidator()
    {
        RuleFor(m => m.Email).NotNull().NotEmpty().EmailAddress();
        RuleFor(m => m.Password).NotNull().NotEmpty().MinimumLength(8);
        RuleFor(m => m.ConfirmPassword).NotNull().NotEmpty().MinimumLength(8).Equal(m => m.Password);
        RuleFor(m => m.RoleId).NotNull().NotEmpty().GreaterThan(0);
    }
}
