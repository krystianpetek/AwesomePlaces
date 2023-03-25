namespace AwesomePlaces.Core.Entities;

public class Coordinate
{
    public Coordinate()
    {

    }

    public Coordinate(double latitude, double longitude)
    {
        Latitude = latitude;
        Longitude = longitude;
    }

    public Guid Id { get; set; } = Guid.NewGuid();
    public double Latitude { get; protected set; }
    public double Longitude { get; protected set; }
}