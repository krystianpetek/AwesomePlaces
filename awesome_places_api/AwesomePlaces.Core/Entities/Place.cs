namespace AwesomePlaces.Core.Entities;

public class Place
{
    public Guid Id { get; protected set; }
    public string Name { get; protected set; }
    public string Description { get; protected set; }
}