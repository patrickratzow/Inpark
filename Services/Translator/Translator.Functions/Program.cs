using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Zeta.Common.Functions;
using Zeta.Inpark.Translator;

var host = new HostBuilder()
    .ConfigureAppConfiguration(builder =>
    {
        builder.AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);
        builder.AddJsonFile("appsettings.Development.json", optional: true, reloadOnChange: true);
        builder.AddEnvironmentVariables();
    })
    .ConfigureFunctionsWorkerDefaults(builder =>
    {
        builder.UseCommon();
    })
    .ConfigureServices((host, services) =>
    {
        services.UseCommon();
        services.AddTranslator(host.Configuration);
    })
    .Build();

host.Run();
