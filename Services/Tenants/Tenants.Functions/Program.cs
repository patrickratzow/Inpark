using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Zeta.Common.Functions;
using Zeta.Common.Functions.Middleware;
using Zeta.Inpark.Tenants;

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
        services.AddTenant(host.Configuration);
    })
    .Build();

host.Run();