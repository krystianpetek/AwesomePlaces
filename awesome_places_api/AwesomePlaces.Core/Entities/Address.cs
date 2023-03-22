namespace AwesomePlaces.Core.Entities;

public class Address
{
    public Guid Id { get; protected set; } = Guid.NewGuid();
    public string Street { get; protected set; }
    public string City { get; protected set; }
    public string State { get; protected set; }
    public string ZipCode { get; protected set; }
    public string Country { get; protected set; }

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