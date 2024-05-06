namespace DiscDog.ApiService;

public static class ClubAPI
{
    public static async Task<IResult> GetClubs(ClubService clubService)
    {
        return TypedResults.Ok(await clubService.GetClubs());
    }
     public static async Task<IResult> GetTeams(TeamService teamService, Guid id)
    {
        var teams = await teamService.GetTeams(id);
        return teams is not null ? TypedResults.Ok(teams) : TypedResults.NotFound();
    }
}
