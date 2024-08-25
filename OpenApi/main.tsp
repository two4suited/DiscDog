import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "./owner.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;

@service({
    title: "Disc Dog",
})
namespace DiscDog;

@tag("owner")
@autoRoute
interface owner extends Resource.ResourceOperations<Owner,Error> {}