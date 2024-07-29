import "./operations.tsp";
import "@typespec/http";

using TypeSpec.Http;
using ResourceOperations;

interface WeekEndpoints{
    op getWeekBySeasonClub(@path seasonId: string, @path clubId: string): {
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
    getWeekById is GetById<Week>;
    createWeek is Create<CreateWeek, Week>;
    updateWeek is Update<CreateWeek,Week>;
    deleteWeek is Delete;
}

model Week extends CreateWeek {
  id: string;
}

model CreateWeek {
  weekNumber: int16;
  seasonId: string;  
}
