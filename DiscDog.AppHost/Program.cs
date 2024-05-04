var builder = DistributedApplication.CreateBuilder(args);

var cache = builder.AddRedis("redis");

var apiService = builder.AddProject<Projects.DiscDog_ApiService>("apiservice");

builder.AddNpmApp("nextjs","../DiscDog.Web.NextJS","dev")
    .WithReference(apiService)
    .WithEnvironment("BROWSER", "none") // Disable opening browser on npm start
    .WithHttpEndpoint(env: "PORT")
    .WithExternalHttpEndpoints();

  


builder.AddProject<Projects.DiscDog_Web>("webfrontend")
    .WithExternalHttpEndpoints()
    .WithReference(apiService);

builder.Build().Run();
