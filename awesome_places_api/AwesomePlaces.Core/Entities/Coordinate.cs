namespace AwesomePlaces.Core.Entities;

public class Coordinate
{
    public Coordinate()
    {

    }

    public Coordinate(double latitute, double longitude)
    {
        Latitute = latitute;
        Longitude = longitude;
    }

    public Guid Id { get; set; } = Guid.NewGuid();
    public double Latitute { get; protected set; }
    public double Longitude { get; protected set; }
}