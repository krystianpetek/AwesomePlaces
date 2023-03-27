using System.ComponentModel;

namespace AwesomePlaces.Application.Models;
public class LoginUserModel
{
    [DefaultValue("userMock@email.com")]
    public string Email { get; set; }
    [DefaultValue("defaultPass")]
    public string Password { get; set; }
}
