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
    public async Task<List<ClubView>> GetClubs()
    {
        return await dbContext.Clubs.Select(c => new ClubView{ Id = c.Id, Name = c.Name }).ToListAsync();
    }
}

public class ClubView
{
    public Guid Id { get; set; }
    public string Name { get; set; }
}