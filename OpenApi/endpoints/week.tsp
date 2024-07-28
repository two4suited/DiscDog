import "./operations.tsp";

interface WeekEndpoints extends ResourceOperations<Week, CreateWeek> {}

model Week extends CreateWeek {
  id: string;
}

model CreateWeek {
  weekNumber: int16;
  seasonId: string;
  clubId: string;
}
