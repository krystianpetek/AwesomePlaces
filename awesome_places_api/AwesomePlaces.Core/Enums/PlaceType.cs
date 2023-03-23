namespace AwesomePlaces.Core.Enums;

[Flags]
public enum PlaceTypes
{
    None = 0,
    Landscape = 1 << 0,
    Mountain = 1 << 1,
    NatureBeauty = 1 << 2,
    Antique = 1 << 3,
    NationalPark = 1 << 4,
    Museum = 1 << 5,
    Forest = 1 << 6,
    Island = 1 << 7,
    Waterfall = 1 << 8,
    Hill = 1 << 9,
    Cliff = 1 << 10,
    Cave = 1 << 11,
    Beach = 1 << 12,
    EntertainmentPark = 1 << 13,
    Garden = 1 << 14,
}
// https://tourismteacher.com/types-of-tourist-attractions/

// https://www.poipoint.pl/poi-aktualizacje?poi=Turystyka
// https://www.ruszajwdroge.pl/p/spis-miejsc.html
// https://www.polska.travel/pl/poznaj-atrakcje-i-zabytki/zabytki-i-inne-atrakcje-2

// https://docs.mapbox.com/api/search/geocoding/