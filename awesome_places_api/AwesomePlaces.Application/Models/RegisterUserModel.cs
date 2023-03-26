using System.Text.Json.Serialization;

namespace AwesomePlaces.Application.Models;
public class RegisterUserModel
{
    public string Email { get; set; }
    public string Password { get; set; }
    public string ConfirmPassword { get; set; }
    
    [JsonIgnore]
    public int RoleId { get; set; } = 1;
}
