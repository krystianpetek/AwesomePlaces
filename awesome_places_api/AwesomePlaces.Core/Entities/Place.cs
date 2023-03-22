using AwesomePlaces.Core.Exceptions;

namespace AwesomePlaces.Core.Entities;

public class Place
{
    public Guid Id { get; protected set; }
    public string Name { get; protected set; }
    public string Description { get; protected set; }
    public PlaceTypes PlaceType { get; protected set; }
    public Coordinate Coordinate { get; protected set; }
    public Address Address { get; protected set; }
    public byte[] Image { get; protected set; }
    public double Rating { get; protected set; }
    public bool RequiredFee { get; protected set; }

    public Place(Guid id, string name, string description, PlaceTypes placeType, Coordinate coordinate, Address address, byte[] image, double rating, bool requiredFee)
    {
        Id = id;
        Name = name;
        Description = description;
        PlaceType = placeType;
        Coordinate = coordinate;
        Address = address;
        Image = image;
        Rating = rating;
        RequiredFee = requiredFee;
    }

    public void ChangeDescription(string description)
    {
        if (string.IsNullOrWhiteSpace(description))
        {
            throw new InvalidPlaceDescriptionException(description);
        }
        this.Description = description;
    }
}
