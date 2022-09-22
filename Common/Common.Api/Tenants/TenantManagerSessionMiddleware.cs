using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;

namespace Zeta.Common.Api;

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
            if (!Guid.TryParse(tenantHeader, out var tenantId))
            {
                tenantId = Guid.Parse("99348443-55F7-4104-83CB-031D29D95A14");
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