namespace AwesomePlaces.Core.Entities;

public class Address
{
    public Guid Id { get; protected set; } = Guid.NewGuid();
    public string Street { get; init; }
    public string City { get; init; }
    public string State { get; init; }
    public string ZipCode { get; init; }
    public string Country { get; init; }

    public Address() { }

    public Address(Guid id, string street, string city, string state, string zipCode, string country)
    {
        Id = id;
        Street = street;
        City = city;
        State = state;
        ZipCode = zipCode;
        Country = country;
    }
}