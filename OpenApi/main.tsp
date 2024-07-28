import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "@typespec/versioning";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.Versioning;

@service({
  title: "Disc Dog API",
})
@server("https://discdog.wiremockapi.cloud/", "Disc Dog API")
namespace DiscDog {
  @route("club")
  @tag("Clubs")
  namespace Clubs {
    op listClubs(): {
      @statusCode statusCode: 200;
      @body pets: Club[];
    } | {
      @statusCode statusCode: 404;
      @body error: NotFoundError;
    } | {
      @statusCode statusCode: 500;
      @body error: InternalServerError;
    };
    op get(@path id: string): {
      @statusCode statusCode: 200;
      @body pet: Club;
    } | {
      @statusCode statusCode: 404;
      @body error: NotFoundError;
    } | {
      @statusCode statusCode: 500;
      @body error: InternalServerError;
    };
    @post
    op createClub(@body pet: CreateClub): {
      @statusCode statusCode: 201;
      @body pet: Club;
    } | {
      @statusCode statusCode: 400;
      @body error: ValidationError;
    } | {
      @statusCode statusCode: 500;
      @body error: InternalServerError;
    };
    @put
    op updateClub(@path id: string, @body pet: CreateClub): {
      @statusCode statusCode: 200;
      @body pet: Club;
    } | {
      @statusCode statusCode: 404;
      @body error: NotFoundError;
    } | {
      @statusCode statusCode: 500;
      @body error: InternalServerError;
    };
  }
  @route("team")
  @tag("Teams")
  namespace Teams {
    
    op list(@path clubId: int32): {
      @statusCode statusCode: 200;
      @body teams: Team[];
    } | {
      @statusCode statusCode: 404;
      @body error: NotFoundError;
    } | {
      @statusCode statusCode: 500;
      @body error: InternalServerError;
    };
    op get(@path clubId: int32, @path teamId: int32): {
      @statusCode statusCode: 200;
      @body team: Team;
    } | {
      @statusCode statusCode: 404;
      @body error: NotFoundError;
    } | {
      @statusCode statusCode: 500;
      @body error: InternalServerError;
    };
    @post
    op create(@path clubId: int32, @body team: CreateTeam): {
      @statusCode statusCode: 201;
      @body team: Team;
    } | {
      @statusCode statusCode: 400;
      @body error: ValidationError;
    } | {
      @statusCode statusCode: 500;
      @body error: InternalServerError;
    };
    @put
    op update(@path clubId: int32, @path teamId: int32, @body team: CreateTeam): {
      @statusCode statusCode: 200;
      @body team: Team;
    } | {
      @statusCode statusCode: 404;
      @body error: NotFoundError;
    } | {
      @statusCode statusCode: 500;
      @body error: InternalServerError;
    };
  }
  @route("season")
  @tag("Seasons")
  namespace Seasons {
    op listSeasons(): {
      @statusCode statusCode: 200;
      @body seasons: Season[];
    } | {
      @statusCode statusCode: 404;
      @body error: NotFoundError;
    } | {
      @statusCode statusCode: 500;
      @body error: InternalServerError;
    };
    op get(@path id: string): {
      @statusCode statusCode: 200;
      @body season: Season;
    } | {
      @statusCode statusCode: 404;
      @body error: NotFoundError;
    } | {
      @statusCode statusCode: 500;
      @body error: InternalServerError;
    };
    op createSeason(@body pet: CreateSeason): {
      @statusCode statusCode: 201;
      @body season: Season;
    } | {
      @statusCode statusCode: 400;
      @body error: ValidationError;
    } | {
      @statusCode statusCode: 500;
      @body error: InternalServerError;
    };
    @put
    op updateSeason(@path id: string, @body pet: CreateSeason): {
      @statusCode statusCode: 200;
      @body season: Season;
    } | {
      @statusCode statusCode: 404;
      @body error: NotFoundError;
    } | {
      @statusCode statusCode: 500;
      @body error: InternalServerError;
    };
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

  model Team {
    id: string;
    name: string;
    description: string;
    clubId: string;
  }
  model CreateTeam {
    name: string;
    description: string;
    clubId: string;
  }

  @error
  model NotFoundError {
    code: "NOT_FOUND";
    message: string;
  }
  model ValidationError {
    code: "VALIDATION_ERROR";
    message: string;
    details: string[];
  }
  @error
  model InternalServerError {
    code: "INTERNAL_SERVER_ERROR";
    message: string;
  }
}
