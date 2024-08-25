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

@tag("Owner")
@autoRoute
interface OwnerResources extends Resource.ResourceOperations<Owner,Error> {}

@tag("Dog")
@autoRoute
interface DogResources extends Resource.ResourceOperations<Dog,Error> {}