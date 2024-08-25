using System;
using Microsoft.EntityFrameworkCore;

namespace DiscDog.Data;

public class DiscDogContext(DbContextOptions<DiscDogContext> options) : DbContext(options)
{
    override protected void OnModelCreating(ModelBuilder modelBuilder)
    {
    }
}
