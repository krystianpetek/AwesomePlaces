using AwesomePlaces.Core.Enums;
using AwesomePlaces.Core.Exceptions;

namespace AwesomePlaces.Core.Entities;

public class Place
{
    public Guid Id { get; protected set; } = Guid.NewGuid();
    public string Name { get; init; }
    public string Description { get; set; }
    public PlaceTypes PlaceType { get; init; }
    public byte[] Image { get; init; }
    public double Rating { get; init; }
    public bool RequiredFee { get; init; }
    public virtual Coordinate Coordinate { get; init; }
    public virtual Address Address { get; init; }

    public Place() { }

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
