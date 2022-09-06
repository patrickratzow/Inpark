using Microsoft.Extensions.DependencyInjection;
using Zeta.UI.Mappers.Umbraco;

namespace Zeta.UI.Mappers;

public static class DependencyInjection
{
    // ReSharper disable once InconsistentNaming
    public static void AddZetaUIMappers(this IServiceCollection services)
    {
        services.AddTransient<FeatureConfig>(sp => new()
        {
            BaseUrl = "https://cms.aalborgzoo.dk"
        });
        services.AddTransient<ConfigurationService>();
    }
}
