namespace AwesomePlaces.Core.Entities.Identity;
public class User
{
	public Guid Id { get; set; }
	public string Email { get; set; }
	public string PasswordHash { get; set; }

	public int RoleId { get; set; }
	public virtual Role Role { get; set; }
}
