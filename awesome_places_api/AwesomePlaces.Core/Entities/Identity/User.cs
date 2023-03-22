using System.Text.Json.Serialization;

namespace AwesomePlaces.Core.Entities.Identity;
public class User
{
    public Guid Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Email { get; set; }
    public string Role { get; set; }

    [JsonIgnore]
    public string? PasswordHash { get; set; }
}
