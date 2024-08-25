import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "./owner.tsp";
import "./dog.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;

@service({
    title: "Disc Dog",
})
@server("http://localhost:8080","Local Host")

namespace DiscDog;

@tag("owner")
@autoRoute
interface owner extends Resource.ResourceOperations<Owner,Error> {}

@tag("dog")
@autoRoute
interface dog extends Resource.ResourceOperations<Dog,Error> {}