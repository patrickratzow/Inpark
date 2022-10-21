using System.Reflection;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Zeta.Common.Api;
using Zeta.Common.Api.Versioning;

namespace Zeta.Inpark.Food;

public static class DependencyInjection
{
    public static IServiceCollection AddFood(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("FoodDatabase");
        services.AddDbContext<FoodDbContext>(opts =>
        {
            opts.UseSqlServer(connectionString);
        });
        
        services.AddMediatR(Assembly.GetExecutingAssembly());
        services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());

        services.AddPipelines();
        services.AddResponseMapper();
        
        return services;
    }
    
    public static void UseFood(this IApplicationBuilder app, IWebHostEnvironment env)
    {
        app.UseVersioning();
        app.UseResponseMapper();
        
        RunMigrations(app.ApplicationServices);
    }

    private static void RunMigrations(IServiceProvider provider)
    {
        using var scope = provider.CreateScope();

        var services = scope.ServiceProvider;

        try
        {
            var context = services.GetRequiredService<FoodDbContext>();

            if (context.Database.IsSqlServer())
                context.Database.Migrate();
            else
                throw new ApplicationException("Database is not SQL Server or connection couldn't be established");
        }
        catch (Exception ex)
        {
            var logger = scope.ServiceProvider.GetRequiredService<ILogger<IHost>>();

            logger.LogError(ex, "An error occurred while migrating or seeding the database");

            throw;
        }
    }
}