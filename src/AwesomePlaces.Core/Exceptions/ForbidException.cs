namespace AwesomePlaces.Core.Exceptions;

public class ForbidException : DomainException
{
	public ForbidException(string message) : base(message)
	{
	}
}
