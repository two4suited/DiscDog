var builder = DistributedApplication.CreateBuilder(args);

var postgres = builder.AddPostgres("postgres").WithPgAdmin().AddDatabase("postgresdb");


var apiService = builder.AddProject<Projects.DiscDog_ApiService>("apiservice");

builder.AddProject<Projects.DiscDog_Web>("webfrontend")
    .WithExternalHttpEndpoints()
    .WithReference(apiService).WithReference(postgres);

builder.Build().Run();
