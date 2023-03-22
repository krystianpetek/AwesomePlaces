namespace AwesomePlaces.Core.Entities;

public class Coordinate
{
    public Coordinate(double latitute, double longitude)
    {
        Latitute = latitute;
        Longitude = longitude;
    }

    public double Latitute { get; protected set; }
    public double Longitude { get; protected set; }
}