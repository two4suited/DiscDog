import "./operations.tsp";

using ResourceOperations;

interface SeasonEndpoints {}

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