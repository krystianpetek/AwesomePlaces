using System.ComponentModel;
using System.Text.Json.Serialization;

namespace AwesomePlaces.Application.Models;
public class RegisterUserModel
{
    [DefaultValue("krystianpetek2@email.com")]
    public string Email { get; set; }
    [DefaultValue("defaultPass")]
    public string Password { get; set; }
    [DefaultValue("defaultPass")]
    public string ConfirmPassword { get; set; }

    [JsonIgnore]
    public int RoleId { get; set; } = 1;

}
