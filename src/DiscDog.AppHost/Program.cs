var builder = DistributedApplication.CreateBuilder(args);

var postgres = builder.AddPostgres("postgres");
var postgresdb = postgres.AddDatabase("postgresdb");

var apiService = builder.AddProject<Projects.DiscDog_ApiService>("apiservice");

builder.AddProject<Projects.DiscDog_Web>("webfrontend")
    .WithExternalHttpEndpoints()
    .WithReference(apiService).WithReference(postgresdb);

builder.Build().Run();
