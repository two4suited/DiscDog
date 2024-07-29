import "./operations.tsp";

using ResourceOperations;

interface SeasonEndpoints {
  getSeasons is GetAll<Season>;
  getSeasonById is GetById<Season>;
  createSeason is Create<CreateSeason, Season>;
  updateSeason is Update<CreateSeason, Season>;
  deleteSeason is Delete;
}

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