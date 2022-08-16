using System.IO;
using Microsoft.Azure.Functions.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Zeta.Inpark.Maps;

[assembly: FunctionsStartup(typeof(Zeta.Maps.Functions.Startup))]

namespace Zeta.Maps.Functions;

public class Startup : FunctionsStartup
{ 
    public override void Configure(IFunctionsHostBuilder builder)
    {
        var context = builder.GetContext();

        var config = new ConfigurationBuilder()
            .AddConfiguration(context.Configuration)
            .AddJsonFile(Path.Combine(context.ApplicationRootPath, "appsettings.json"), optional: true,
                reloadOnChange: false)
            .AddJsonFile(Path.Combine(context.ApplicationRootPath, $"appsettings.{context.EnvironmentName}.json"),
                optional: true, reloadOnChange: false)
            .AddEnvironmentVariables()
            .Build();

        builder.Services.AddSingleton<IConfiguration>(_ => config);
        builder.Services.AddMaps(config);
    }
}
