namespace AwesomePlaces.Core.Entities;

[Flags]
public enum PlaceTypes
{
    Landscape = 1 << 0,
    Mountain = 1 << 1,
    Nature = 1 << 2,
    Antique = 1 << 3
}