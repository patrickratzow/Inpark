using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;

namespace Zoo.Common.Api;

public static class ClockDependencyInjection
{
    public static void AddClock(this IServiceCollection services)
    {
        services.TryAddSingleton<IClock, Clock>();
    }
}