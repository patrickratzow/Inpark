using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;

namespace Zoo.Common.Api;

public static class DependencyInjection
{
    public static void AddResponseMapper(this IServiceCollection services)
    {
        services.TryAddScoped<IResponseMapper, DefaultResponseMapper>();
    }

    public static void UseResponseMapper(this IApplicationBuilder app)
    {
    }
}