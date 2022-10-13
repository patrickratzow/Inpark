using System.Reflection;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Zeta.Common.Api;
using Zeta.Common.Api.Versioning;
using Zeta.Inpark.Auth.Services;

namespace Zeta.Inpark.Auth;

public static class DependencyInjection
{
    public static void AddAuth(this IServiceCollection services, IConfiguration configuration)
    {
        var dbConnection = configuration.GetConnectionString("AuthConnection");
        services.AddDbContext<AuthDbContext>(options =>
        {
            options.UseSqlServer(dbConnection);
        });

        services.AddMemoryCache();
        services.AddMediatR(Assembly.GetExecutingAssembly());
        services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());
        services.AddVersioning();
        services.AddPipelines();
        services.AddClock();

        services.TryAddScoped<DomainEventService>();
        services.TryAddSingleton<PasswordService>();
        services.TryAddSingleton<IJwtService, JwtService>();
        services.Configure<JwtOptions>(configuration.GetSection(JwtOptions.Position));

        services.AddResponseMapper();
    }

    public static void UseAuth(this IApplicationBuilder app, IWebHostEnvironment env)
    {
        app.UseCors(options =>
            options.AllowAnyOrigin()
                .AllowAnyHeader()
                .AllowAnyMethod()
        );
        
        app.UseVersioning();
        app.UseResponseMapper();
        
        RunMigrations(app.ApplicationServices);
    }

    static void RunMigrations(IServiceProvider provider)
    {
        using var scope = provider.CreateScope();

        var services = scope.ServiceProvider;

        try
        {
            var context = services.GetRequiredService<AuthDbContext>();

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