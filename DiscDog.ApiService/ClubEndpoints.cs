using Microsoft.AspNetCore.Http.HttpResults;

namespace DiscDog.ApiService;

public static class ClubEndpoints
{
    public static void RegisterClubEndpoints(this WebApplication app)
    {
        var clubApis = app.MapGroup("/club").WithOpenApi().WithTags("Clubs");
        
        clubApis.MapGet("/", async Task<Results<Ok<List<ClubView>>,NoContent>> (ClubService clubService) => {
            var clubs = await clubService.GetClubs();
            return clubs.Count > 0 ? TypedResults.Ok(clubs) : TypedResults.NoContent();
        }).WithName("GetClubs");

        clubApis.MapGet("/{id}/teams", async Task<Results<Ok<List<TeamView>>,NotFound>> (TeamService teamService, Guid id) => {
            var teams = await teamService.GetTeams(id);
            return teams is not null ? TypedResults.Ok(teams) : TypedResults.NotFound();
        }).WithName("GetTeams");

        clubApis.MapGet("/{id}", async Task<Results<Ok<ClubView>,NotFound>> (ClubService clubService, Guid id) => {
            var club = await clubService.GetClub(id);
            return club is not null ? TypedResults.Ok(club) : TypedResults.NotFound();
        }).WithName("GetClub");

        clubApis.MapPost("/", async Task<Results<Created,UnprocessableEntity>> (ClubService clubService, ClubAdd clubAdd) => {
            var club = await clubService.AddClub(clubAdd);
            return TypedResults.Created($"/{club.Id}");
        }).WithName("AddClub");
       
       clubApis.MapPut("/{id}", async Task<Results<Ok<ClubView>,NotFound>> (ClubService clubService, Guid id, ClubAdd clubAdd) => {
            var club = await clubService.UpdateClub(id, clubAdd);
            return club is not null ? TypedResults.Ok(club) : TypedResults.NotFound();
        }).WithName("UpdateClub");

        
    }
}
