using System.Reflection;
using Hangfire;
using Hangfire.SqlServer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Polly;
using Polly.Extensions.Http;
using Zoo.Inpark.Common;
using Zoo.Inpark.Features.Animals;
using Zoo.Inpark.Features.OpeningHours.AalborgZoo;
using Zoo.Inpark.Features.OpeningHours.Interfaces;
using Zoo.Inpark.Services;

namespace Zoo.Inpark;

public static class DependencyInjection
{
    private static readonly ILoggerFactory EfLoggerFactory = LoggerFactory.Create(builder =>
    {
        builder.AddConsole();
    });
    
    public static void AddInpark(this IServiceCollection services, IConfiguration configuration)
    {
        var dbConnection = configuration.GetConnectionString("InparkConnection");
        services.AddDbContext<InparkDbContext>(options =>
        {
            options.UseSqlServer(dbConnection);
            options.UseLoggerFactory(EfLoggerFactory);
        });
        services.AddMemoryCache();
        services.AddMediatR(Assembly.GetExecutingAssembly());
        services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());
        services.AddPipelines();
        services.AddClock();
        services.AddHangFire(dbConnection);
        services.AddSingleton<IEventPublisher, EventPublisher>();

        services.AddSingleton<IHtmlTransformer, HtmlTransformer>();
        
        services.AddSingleton<IAalborgZooContentRepository, AalborgZooContentRepository>();
        services.AddHttpClient<IAalborgZooContentRepository, AalborgZooContentRepository>(AalborgZooHttpClient)
            .AddPolicyHandler(GetRetryPolicy());
        services.AddSingleton<IAalborgZooAnimalContentMapper, AalborgZooAnimalContentMapper>();

        services.AddSingleton<IOpeningHoursRepository, AalborgZooOpeningHoursRepository>();
        services.AddHttpClient<IOpeningHoursRepository, AalborgZooOpeningHoursRepository>(AalborgZooHttpClient)
            .AddPolicyHandler(GetRetryPolicy());
        services.AddSingleton<IOpeningHoursMapper, AalborgZooOpeningHoursMapper>();
        
        services.AddResponseMapper();
    }

    public static void UseInpark(this IApplicationBuilder app, IWebHostEnvironment env)
    {
        app.UseResponseMapper();
        
        RunMigrations(app.ApplicationServices);

        if (env.IsDevelopment())
        {
            app.UseHangfireDashboard();
        }
        else
        {
            // Force JobStorage to be resolved outside development
            // Not having JobStorage setup will cause RecurringJob to fail
            app.ApplicationServices.GetRequiredService<JobStorage>();
        }
        
        RecurringJob.AddOrUpdate<AalborgZooOpeningHoursJob>(
            x => x.Execute(),
            "* 3 * * *", // Every day at 3 AM 
            TimeZoneInfo.Local
        );
        RecurringJob.AddOrUpdate<AalborgZooUpdateAnimalsJob>(
            x => x.Execute(),
            "* 3 * * *", // Every day at 3 AM 
            TimeZoneInfo.Local
        );
    }

    private static IServiceCollection AddHangFire(this IServiceCollection services, string connectionString)
    {
        // Add Hangfire services.
        services.AddHangfire(configuration => configuration
            .SetDataCompatibilityLevel(CompatibilityLevel.Version_170)
            .UseSimpleAssemblyNameTypeSerializer()
            .UseRecommendedSerializerSettings()
            .UseSqlServerStorage(connectionString, new SqlServerStorageOptions
            {
           
            }));

        // Add the processing server as IHostedService
        services.AddHangfireServer();

        return services;
    }
    
    private static void RunMigrations(IServiceProvider provider)
    {
        using var scope = provider.CreateScope();

        var services = scope.ServiceProvider;

        try
        {
            var context = services.GetRequiredService<InparkDbContext>();

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
    
    private static IAsyncPolicy<HttpResponseMessage> GetRetryPolicy()
    {
        return HttpPolicyExtensions
            .HandleTransientHttpError()
            .OrResult(msg => msg.StatusCode == System.Net.HttpStatusCode.NotFound)
            .WaitAndRetryAsync(3, retryAttempt => TimeSpan.FromSeconds(Math.Pow(2,
                retryAttempt)));
    }

    private static void AalborgZooHttpClient(HttpClient client)
    {
        client.BaseAddress = new("https://api.aalborgzoo.dk/api/");
    }
}