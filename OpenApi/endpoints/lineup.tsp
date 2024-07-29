import "./operations.tsp";
import "@typespec/http";

using TypeSpec.Http;
using ResourceOperations;

interface LineupEndpoints  {
    op getLineupsBySeasonAndWeek(@path seasonId: string, @path weekId: string): {
        @statusCode statusCode: 200;
        @body items: Lineup[];
      } | {
        @statusCode statusCode: 404;
        @body error: NotFoundError;
      } | {
        @statusCode statusCode: 500;
        @body error: InternalServerError;
      };
    
    getLineupById is GetById<Lineup>;
    createLineup is Create<CreateLineup, Lineup>;
    updateLineup is Update<CreateLineup,Lineup>;
    deleteLineup is Delete;
}

model Lineup extends CreateLineup {
  id: string;
}

model CreateLineup {
  order: int16;
  teamid: string;
  seasonId: string;
  weekId: string;
}
