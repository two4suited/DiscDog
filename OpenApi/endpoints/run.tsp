import "./operations.tsp";

using ResourceOperations;

interface RunEndpoints  {}

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