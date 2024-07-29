import "./operations.tsp";

using ResourceOperations;


interface TeamEndpoints{
  getTeams is GetAll<Team>;
  getTeamById is GetById<Team>;
  createTeam is Create<CreateTeam, Team>;
  updateTeam is Update<CreateTeam,Team>;
  deleteTeam is Delete;

}

model Team {
  id: string;
  name: string;
  description: string;
  clubId: string;
}
model CreateTeam {
  name: string;
  description: string;
  clubId: string;
}
