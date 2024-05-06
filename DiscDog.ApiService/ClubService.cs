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

    public async Task<ClubView?> GetClub(Guid id)
    {
        var club = await dbContext.Clubs.FindAsync(id);
        if (club is null) return null;
        return new ClubView{ Id = club.Id, Name = club.Name };
    }
    public async Task<ClubView> AddClub(ClubAdd clubAdd)
    {
        var club = new Club{ Name = clubAdd.Name };
        dbContext.Clubs.Add(club);
        await dbContext.SaveChangesAsync();
        return new ClubView{ Id = club.Id, Name = club.Name };
    }
    public async Task<ClubView?> UpdateClub(Guid id, ClubAdd clubAdd)
    {
        var club = await dbContext.Clubs.FindAsync(id);
        if (club is null) return null;
        club.Name = clubAdd.Name;
        await dbContext.SaveChangesAsync();
        return new ClubView{ Id = club.Id, Name = club.Name };
    }
}

public class ClubView
{
    public Guid Id { get; set; }
    public string Name { get; set; }
}

public class ClubAdd
{
    public string Name { get; set; }
}