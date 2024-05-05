using Microsoft.EntityFrameworkCore;

namespace DiscDog.ApiService;

public class ClubService
{
    private readonly DiscDogDbContext dbContext;

    public ClubService(DiscDogDbContext dbContext)
    {
        this.dbContext = dbContext;
        dbContext.Database.EnsureCreated();
    }
    public List<ClubView> GetClubs()
    {
        return dbContext.Clubs.Select(c => new ClubView{ Id = c.Id, Name = c.Name }).ToList();
    }
}

public class ClubView
{
    public Guid Id { get; set; }
    public string Name { get; set; }
}