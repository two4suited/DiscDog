import "./operations.tsp";

interface SeasonEndpoints extends ResourceOperations<Season, CreateSeason> {}

model Season {
  id: string;
  name: string;
  description: string;
  StartDate: plainDate;
  EndDate: plainDate;
}
model CreateSeason {
  name: string;
  description: string;
  StartDate: plainDate;
  EndDate: plainDate;
}