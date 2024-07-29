import "./operations.tsp";

using ResourceOperations;

interface WeekEndpoints{}

model Week extends CreateWeek {
  id: string;
}

model CreateWeek {
  weekNumber: int16;
  seasonId: string;
  clubId: string;
}
