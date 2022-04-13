using System.Reflection;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using Polly;
using Polly.Extensions.Http;
using Zoo.Common.Api.Pipelines;
using Zoo.Inpark.Features.Animals.Providers;
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

        services.AddSingleton<IAnimalProvider, AalborgZooAnimalProvider>();
        services.AddSingleton<IHtmlTransformer, HtmlTransformer>();
        services.AddHttpClient<IAnimalProvider, AalborgZooAnimalProvider>(httpClient =>
            {
                httpClient.BaseAddress = new("https://api.aalborgzoo.dk/api/");
            })
            .AddPolicyHandler(GetRetryPolicy());
        
        
        services.AddResponseMapper();
    }

    public static void UseInpark(this IApplicationBuilder app)
    {
        app.UseResponseMapper();
        
        RunMigrations(app.ApplicationServices);
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
}