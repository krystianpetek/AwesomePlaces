using AwesomePlaces.Core.Enums;
using AwesomePlaces.Core.Exceptions;

namespace AwesomePlaces.Core.Entities;

public class Place
{
    public Guid Id { get; protected set; } = Guid.NewGuid();
    public string Name { get; protected set; }
    public string Description { get; protected set; }
    public PlaceTypes PlaceType { get; protected set; }
    //public int CoordinateId { get; protected set; }
    //public int AddressId { get; protected set; }
    public byte[] Image { get; protected set; }
    public double Rating { get; protected set; }
    public bool RequiredFee { get; protected set; }
    public virtual Coordinate Coordinate { get; protected set; }
    public virtual Address Address { get; protected set; }

    public Place(){}

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
