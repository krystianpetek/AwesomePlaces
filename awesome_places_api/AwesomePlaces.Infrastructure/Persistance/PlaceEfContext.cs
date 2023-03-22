using AwesomePlaces.Core.Entities;
using Microsoft.EntityFrameworkCore;

namespace AwesomePlaces.Infrastructure.Persistance;
public class PlaceEfContext : DbContext
{
    public PlaceEfContext(DbContextOptions<PlaceEfContext> dbContextOptions) : base(dbContextOptions)
    {
    }

    public DbSet<Place> Places { get; set; }
    public DbSet<Coordinate> Coordinates { get; set; }
    public DbSet<Address> Addresses { get; set; }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
    }
}
