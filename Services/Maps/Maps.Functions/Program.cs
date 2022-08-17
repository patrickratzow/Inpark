using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Zeta.Inpark.Maps;
using Zeta.Inpark.Maps.Functions.Middleware;

var host = new HostBuilder()
    .ConfigureAppConfiguration(builder =>
    {
        builder.AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);
        builder.AddJsonFile("appsettings.Development.json", optional: true, reloadOnChange: true);
        builder.AddEnvironmentVariables();
    })
    .ConfigureFunctionsWorkerDefaults(builder =>
    {
        builder.UseMiddleware<FluentValidationMiddleware>();
        builder.UseMiddleware<ModelBindingMiddleware>();
    })
    .ConfigureServices((host, services) =>
    {
        services.AddMaps(host.Configuration);
    })
    .Build();

await host.RunAsync();