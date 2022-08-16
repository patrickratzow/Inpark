using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Zeta.Inpark.Maps;

public static class DependencyInjection
{
    public static IServiceCollection AddMaps(this IServiceCollection services, IConfiguration configuration)
    {
        return services;
    }
}