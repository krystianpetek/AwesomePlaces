using AwesomePlaces.Core.Entities;
using Microsoft.EntityFrameworkCore;

namespace AwesomePlaces.Infrastructure.Persistance;
public class PlaceDbContext : DbContext
{
    public PlaceDbContext(DbContextOptions<PlaceDbContext> dbContextOptions) : base(dbContextOptions)
    {
    }

    public DbSet<Place> Places { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
    }
}
