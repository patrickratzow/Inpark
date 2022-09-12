using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Zeta.Common.Functions.Middleware;
using Zoo.Common.Api;

namespace Zeta.Common.Functions;

public static class DependencyInjection
{
    public static void UseCommon(this IServiceCollection services)
    {
        services.AddResponseMapper();
    }
    
    public static void UseCommon(this IFunctionsWorkerApplicationBuilder builder)
    {
        builder.UseMiddleware<FluentValidationMiddleware>();
        builder.UseMiddleware<ModelBindingMiddleware>();
    }
}