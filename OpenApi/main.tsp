import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "./endpoints/club.tsp";
import "./endpoints/team.tsp";
import "./endpoints/seasons.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;

@service({
  title: "Disc Dog API",
})
@server("https://discdog.wiremockapi.cloud/", "Disc Dog API")

namespace DiscDog;

@route("club")
@tag("Clubs")
interface ClubRoutes extends ClubEndpoints {}

@route("team")
@tag("Teams")
interface TeamRoutes extends TeamEndpoints {}

@route("season")
@tag("Seasons")
interface SeasonRoutes extends SeasonEndpoints {}



