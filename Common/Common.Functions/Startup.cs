using Microsoft.Azure.Functions.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection;
using Zoo.Common.Api.EventBus;

[assembly: FunctionsStartup(typeof(Common.Functions.Startup))]

namespace Common.Functions;

public class Startup : FunctionsStartup
{
    public override void Configure(IFunctionsHostBuilder builder)
    {
        builder.Services.AddSingleton<IEventBus, AzureServiceBus>();
    }
}
