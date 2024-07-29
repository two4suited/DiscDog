import "./operations.tsp";

using ResourceOperations;

interface ClubEndpoints  {
  getClubs is GetAll<Club>;
  getClubById is GetById<Club>;
  createClub is Create<CreateClub, Club>;
  updateClub is Update<CreateClub,Club>;
  deleteClub is Delete;
}

model Club {
  id: string;
  name: string;
  description: string;
}
model CreateClub {
  name: string;
  description: string;
}
