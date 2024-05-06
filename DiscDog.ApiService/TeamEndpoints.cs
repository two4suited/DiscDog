using Microsoft.AspNetCore.Http.HttpResults;

namespace DiscDog.ApiService;

public static class TeamEndpoints
{
    public static void RegisterTeamEndpoints(this WebApplication app)
    {
        var teamApis = app.MapGroup("/team").WithOpenApi().WithTags("Teams");
        
        teamApis.MapGet("/{id}", async Task<Results<Ok<TeamView>,NotFound>> (TeamService teamService, Guid id) => {
            var team = await teamService.GetTeam(id);
            return team is not null ? TypedResults.Ok(team) : TypedResults.NotFound();
        }).WithName("GetTeam");

        teamApis.MapPost("/", async Task<Results<Created,UnprocessableEntity>> (TeamService teamService, TeamAdd teamAdd) => {
            var team = await teamService.AddTeam(teamAdd);
            return TypedResults.Created($"/{team.Id}");
        }).WithName("AddTeam");
       
       teamApis.MapPut("/{id}", async Task<Results<Ok<TeamView>,NotFound>> (TeamService teamService, Guid id, TeamAdd teamAdd) => {
            var team = await teamService.UpdateTeam(id, teamAdd);
            return team is not null ? TypedResults.Ok(team) : TypedResults.NotFound();
        }).WithName("UpdateTeam");
    }
}
