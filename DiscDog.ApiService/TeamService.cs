using Microsoft.EntityFrameworkCore;

namespace DiscDog.ApiService;

public class TeamService(DiscDogDbContext context)
{
    //Get all teams by clubid
    public async Task<List<TeamView>> GetTeams(Guid clubId)
    {
        return await context.Teams.Where(t => t.ClubId == clubId).Select(t => new TeamView { Dog = t.Dog, Id= t.Id, Person = t.Person}).ToListAsync();
    }
    public async Task<TeamView?> GetTeam(Guid id)
    {
        var team = await context.Teams.FindAsync(id);
        if (team is null) return null;
        return new TeamView { Dog = team.Dog, Id = team.Id, Person = team.Person };
    }
    public async Task<TeamView> AddTeam(TeamAdd teamAdd)
    {
        var team = new Team { Dog = teamAdd.Dog, Person = teamAdd.Person };
        context.Teams.Add(team);
        await context.SaveChangesAsync();
        return new TeamView { Dog = team.Dog, Id = team.Id, Person = team.Person };
    }
    public async Task<TeamView?> UpdateTeam(Guid id, TeamAdd teamAdd)
    {
        var team = await context.Teams.FindAsync(id);
        if (team is null) return null;
        team.Dog = teamAdd.Dog;
        team.Person = teamAdd.Person;
        await context.SaveChangesAsync();
        return new TeamView { Dog = team.Dog, Id = team.Id, Person = team.Person };
    }
}

public class TeamView
{
    public Guid Id { get; set; }
    public string Person { get; set; }
    public string Dog { get; set; }
}
public class TeamAdd
{
    public string Person { get; set; }
    public string Dog { get; set; }
}