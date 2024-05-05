var builder = DistributedApplication.CreateBuilder(args);

var apiService = builder.AddProject<Projects.DiscDog_ApiService>("apiservice");

builder.AddProject<Projects.DiscDog_Web>("webfrontend")
    .WithExternalHttpEndpoints()
    .WithReference(apiService);

builder.Build().Run();
