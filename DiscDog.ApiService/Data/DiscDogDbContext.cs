using Microsoft.EntityFrameworkCore;
using System;

namespace DiscDog.ApiService;

public class DiscDogDbContext(DbContextOptions<DiscDogDbContext> options) : DbContext(options)
{
    public DbSet<Team> Teams { get; set; }
    public DbSet<Club> Clubs { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.Entity<Team>()
            .HasKey(e => e.Id);

        modelBuilder.Entity<Club>()
            .HasKey(e => e.Id);

        modelBuilder.Entity<Team>()
            .HasOne(t => t.Club)
            .WithMany(c => c.Teams)
            .HasForeignKey(t => t.ClubId);

        Guid club1Id = Guid.NewGuid();
        Guid club2Id = Guid.NewGuid();
        Guid club3Id = Guid.NewGuid();
        
        // Seed data for Club
        modelBuilder.Entity<Club>().HasData(
            new Club { Id = club1Id, Name = "Club1" },
            new Club { Id = club2Id, Name = "Club2" },
            new Club { Id = club3Id, Name = "Club3" }
        );

     

        modelBuilder.Entity<Team>().HasData(
            new Team { Id = Guid.NewGuid(), Person = "Person1", Dog = "Dog1", ClubId = club1Id },
            new Team { Id = Guid.NewGuid(), Person = "Person2", Dog = "Dog2", ClubId = club1Id },
            new Team { Id = Guid.NewGuid(), Person = "Person3", Dog = "Dog3", ClubId = club2Id },
            new Team { Id = Guid.NewGuid(), Person = "Person4", Dog = "Dog4", ClubId = club2Id },
            new Team { Id = Guid.NewGuid(), Person = "Person5", Dog = "Dog5", ClubId = club3Id }
        );
    }
}