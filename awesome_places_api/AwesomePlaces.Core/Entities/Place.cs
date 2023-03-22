namespace AwesomePlaces.Core.Entities;

public class Place
{
    public Guid Id { get; protected set; }
    public string Name { get; protected set; }
    public string Description { get; protected set; }
    public PlaceTypes PlaceType { get; protected set; }
    public Address Address { get; protected set; }
    public byte[] Image { get; protected set; }
    public double Rating { get; protected set; }
    public bool RequiredFee { get; protected set; }
}
