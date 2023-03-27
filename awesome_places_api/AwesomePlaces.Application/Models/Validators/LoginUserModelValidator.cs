using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AwesomePlaces.Application.Models.Validators;
public class LoginUserModelValidator : AbstractValidator<LoginUserModel>
{
    public LoginUserModelValidator()
    {
        RuleFor(m => m.Email).EmailAddress();
        RuleFor(m => m.Password).NotNull().NotEmpty().MinimumLength(8);
    }
}
