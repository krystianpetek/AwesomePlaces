using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AwesomePlaces.Application.Models;
public class LoginUserModel
{
    [DefaultValue("userMock@email.com")]
    public string Email { get; set; }
    [DefaultValue("defaultPass")]
    public string Password { get; set; }
}
