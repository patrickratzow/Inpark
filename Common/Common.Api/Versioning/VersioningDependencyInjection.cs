using System.Net;
using System.Text;
using System.Text.Json;
using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;

namespace Zeta.Common.Api.Versioning;

public static class VersioningDependencyInjection
{
    public static void AddVersioning(this IServiceCollection services)
    {
        services.TryAddScoped<IVersionService, VersionService>();
        
        if (services.All(x => x.ImplementationType != typeof(VersioningPipeline<,>)))
        {
            services.AddTransient(typeof(IPipelineBehavior<,>), typeof(VersioningPipeline<,>));
        }
    }

    public static void UseVersioning(this IApplicationBuilder app)
    {
        app.Use(async (context, next) =>
        {
            var versionService = context.RequestServices.GetRequiredService<IVersionService>();
            var versionHeader = context.Request.Headers["X-Version"].ToString();
            
            versionService.SetVersion(versionHeader);
            
            await next(context);
        });
        
        app.UseExceptionHandler(x =>
        {
            x.Run(async context =>
            {
                var errorFeature = context.Features.Get<IExceptionHandlerFeature>();
                var exception = errorFeature?.Error;
                if (exception is null) return;
                if (exception is not VersionNotSupportedException versionNotSupportedException)
                {
                    throw exception;
                }

                var error = new PropertyError("X-Version", versionNotSupportedException.Message);
                var errorText = JsonSerializer.Serialize(error);
                context.Response.StatusCode = (int)HttpStatusCode.BadRequest;
                context.Response.ContentType = "application/json";
                await context.Response.WriteAsync(errorText, Encoding.UTF8);
            });
        });
    }
}