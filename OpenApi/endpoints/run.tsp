import "./operations.tsp";

interface RunEndpoints extends ResourceOperations<Run, CreateRun> {}

model Run extends CreateRun {
  id: string;
}
model CreateRun {
  weekId: string;
  seasonId: string;
  clubId: string;
  scores: decimal[];
  teamid: string;
}