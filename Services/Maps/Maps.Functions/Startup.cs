using Microsoft.Azure.Functions.Extensions.DependencyInjection;
using Zeta.Inpark.Maps.Functions;

[assembly: FunctionsStartup(typeof(Startup))]

namespace Zeta.Inpark.Maps.Functions;

public class Startup : FunctionsStartup
{ 
    public override void Configure(IFunctionsHostBuilder builder)
    {
        var context = builder.GetContext();

        builder.Services.AddMaps(context.Configuration);
    }
}
