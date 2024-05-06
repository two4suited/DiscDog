using Microsoft.EntityFrameworkCore;

namespace DiscDog.ApiService;

public class TeamService(DiscDogDbContext context)
{
    //Get all teams by clubid
    public async Task<List<TeamView>> GetTeams(Guid clubId)
    {
        return await context.Teams.Where(t => t.ClubId == clubId).Select(t => new TeamView { Dog = t.Dog, Id= t.Id, Person = t.Person}).ToListAsync();
    }
}

public class TeamView
{
    public Guid Id { get; set; }
    public string Person { get; set; }
    public string Dog { get; set; }
}