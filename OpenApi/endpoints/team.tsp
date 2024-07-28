interface TeamEndpoints extends ResourceOperations<Team, CreateTeam> {}

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
