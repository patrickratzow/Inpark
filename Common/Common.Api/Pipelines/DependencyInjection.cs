using MediatR;
using Microsoft.Extensions.DependencyInjection;

namespace Zoo.Common.Api;

public static class PipelinesDependencyInjection
{
    public static void AddPipelines(this IServiceCollection services)
    {
        if (services.All(x => x.ImplementationType != typeof(ValidationPipeline<,>)))
        {
            services.AddTransient(typeof(IPipelineBehavior<,>), typeof(ValidationPipeline<,>));
        }
        if (services.All(x => x.ImplementationType != typeof(LoggingPipeline<,>)))
        {
            services.AddTransient(typeof(IPipelineBehavior<,>), typeof(LoggingPipeline<,>));
        }
    }
}