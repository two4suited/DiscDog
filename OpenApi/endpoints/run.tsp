import "./operations.tsp";
import "@typespec/http";

using TypeSpec.Http;
using ResourceOperations;

interface RunEndpoints  {
    op getRunsByWeekId(@path weekId: string): {
        @statusCode statusCode: 200;
        @body items: Lineup[];
      } | {
        @statusCode statusCode: 404;
        @body error: NotFoundError;
      } | {
        @statusCode statusCode: 400;
        @body error: BadRequest;
      } | {
        @statusCode statusCode: 500;
        @body error: InternalServerError;
      };
    getRunById is GetById<Run>;
    createRun is Create<CreateRun, Run>;
    updateRun is Update<CreateRun,Run>;
    deleteRun is Delete;
}

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