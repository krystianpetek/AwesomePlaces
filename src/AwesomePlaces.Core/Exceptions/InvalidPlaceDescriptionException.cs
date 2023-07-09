namespace AwesomePlaces.Core.Exceptions;

public class InvalidPlaceDescriptionException : DomainException
{
	public override string Code { get; } = "invalid_place_description";

	public InvalidPlaceDescriptionException(string description)
		: base($"Place description is invalid: {description}.")
	{
	}
}
