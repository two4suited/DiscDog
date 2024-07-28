import "./operations.tsp";

interface LineupEndpoints extends ResourceOperations<Lineup, CreateLineup> {}

model Lineup extends CreateLineup {
  id: string;
}

model CreateLineup {
  order: int16;
  teamid: string;
}
