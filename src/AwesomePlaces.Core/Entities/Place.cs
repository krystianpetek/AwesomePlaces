using AwesomePlaces.Core.Enums;
using AwesomePlaces.Core.Exceptions;

namespace AwesomePlaces.Core.Entities;

public class Place
{
	public Guid Id { get; protected set; } = Guid.NewGuid();
	private string Name { get; init; }
	private string Description { get; set; }
	private PlaceTypes PlaceType { get; init; }
	private byte[] Image { get; init; }
	private double Rating { get; init; }
	private bool RequiredFee { get; init; }
	public virtual Coordinate Coordinate { get; init; }
	public virtual Address Address { get; init; }

	private Place() { }

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
