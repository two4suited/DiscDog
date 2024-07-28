import "./operations.tsp";

interface ClubEndpoints extends ResourceOperations<Club, CreateClub> {}

model Club {
  id: string;
  name: string;
  description: string;
}
model CreateClub {
  name: string;
  description: string;
}
