﻿using Microsoft.Extensions.Hosting;

namespace AwesomePlaces.Infrastructure.Persistance;
public static class PlaceSeedContext
{
    public static IHost PlaceContextSeed(this IHost host)
    {

        return host;
    }
}
