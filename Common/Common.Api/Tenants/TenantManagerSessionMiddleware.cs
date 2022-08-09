using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;

namespace Zoo.Common.Api;

public static class TenantManagerSessionMiddleware
{
    public static IServiceCollection AddTenantManager(this IServiceCollection services)
    {
        services.TryAddScoped<ITenantManager, TenantManager>();
        
        return services;
    }
    
    public static IApplicationBuilder UseTenantManagerSession(this IApplicationBuilder app)
    {
        async Task NoTenantFound(HttpContext context)
        {
            context.Response.StatusCode = StatusCodes.Status400BadRequest;
            await context.Response.WriteAsync("No tenant found");
        }

        app.Use(async (context, next) =>
        {
            // Don't care about options
            if (context.Request.Method == "OPTIONS")
            {
                await next();
                
                return;
            }
            
            var tenantManager = context.RequestServices.GetRequiredService<ITenantManager>();
            var tenantHeader = context.Request.Headers["X-Tenant"];
            if (tenantHeader.Count <= 0)
            {
                await NoTenantFound(context);

                return;
            }
            if (!Guid.TryParse(tenantHeader, out var tenantId))
            {
                await NoTenantFound(context);
                
                return;
            }
            var tenantRepository = context.RequestServices.GetRequiredService<ITenantManager>();
            var tenant = await tenantRepository.GetTenant(tenantId);
            if (tenant is null)
            {
                await NoTenantFound(context);

                return;
            }

            tenantManager.Tenant = tenant;

            await next();
        });

        return app;
    }
}