﻿using AwesomePlaces.Core.Entities;
using AwesomePlaces.Core.Entities.Identity;
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

	public DbSet<User> Users { get; set; }
	public DbSet<Role> Roles { get; set; }

	protected override void OnModelCreating(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<Coordinate>().HasKey(c => c.Id);

		modelBuilder.Entity<User>()
			.Property(u => u.Email)
			.IsRequired();

		modelBuilder.Entity<Role>()
			.Property(u => u.Name)
			.IsRequired();

		modelBuilder.Entity<Role>().HasData(
			new List<Role>()
			{
				new Role()
				{
					Id = 1,
					Name = "User"
				},
				new Role()
				{
					Id = 2,
					Name = "Manager"
			},
				new Role()
				{
					Id = 3,
					Name = "Admin"
				},
			});
	}
}
