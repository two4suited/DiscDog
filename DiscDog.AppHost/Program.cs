var builder = DistributedApplication.CreateBuilder(args);

var cache = builder.AddRedis("redis");
var db = builder
    .AddPostgres("DiscDog")
    .WithPgAdmin()
    .AddDatabase("DiscDogDb");
    

var apiService = builder.AddProject<Projects.DiscDog_ApiService>("api")
    .WithReference(db);

builder.AddProject<Projects.DiscDog_Web>("web")
    .WithExternalHttpEndpoints()
    .WithReference(apiService)
    .WithReference(cache);

builder.Build().Run();
