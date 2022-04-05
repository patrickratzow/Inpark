using System.Reflection;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;

namespace Zoo.Payments;

public static class DependencyInjection
{
    private static readonly ILoggerFactory EfLoggerFactory = LoggerFactory.Create(builder =>
    {
        builder.AddConsole();
    });

    public static void AddPayments(this IServiceCollection services, IConfiguration configuration)
    {
        var dbConnection = configuration.GetConnectionString("DefaultConnection");
        services.AddDbContext<PaymentsDbContext>(options =>
        {
            options.UseSqlServer(dbConnection);
            options.UseLoggerFactory(EfLoggerFactory);
        });
        services.AddMediatR(Assembly.GetExecutingAssembly());
        services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());

        services.AddResponseMapper();

        services.AddSwaggerGen(options =>
        {
            options.SwaggerDoc("v1", new()
            {
                Version = "v1",
                Title = "Zoo - Payments API",
                Description = "Payments API for Zoo"
            });
            options.AddSecurityDefinition("bearer", new()
            {
                Type = SecuritySchemeType.Http,
                BearerFormat = "Token",
                In = ParameterLocation.Header,
                Scheme = "bearer"
            });
            options.TagActionsBy(apiDescription =>
            {
                var actionDescriptor = (ControllerActionDescriptor)apiDescription.ActionDescriptor;
                var controller = actionDescriptor.ControllerTypeInfo;
                var groupAttribute = controller.GetCustomAttribute<MethodGroupAttribute>();
                if (groupAttribute is null) return new List<string>();

                return new List<string>
                {
                    groupAttribute.Name
                };
            });
            options.CustomOperationIds(operation =>
            {
                if (operation.ActionDescriptor is not ControllerActionDescriptor controllerActionDescriptor)
                    throw new InvalidOperationException("ActionDescriptor does not originate from a controller");

                return controllerActionDescriptor.ActionName;
            });
            
            options.UseZooOptions();

            // using System.Reflection;
            var xmlFilename = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
            options.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, xmlFilename));
        });

    }

    public static void UsePayments(this IApplicationBuilder app)
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
            var context = services.GetRequiredService<PaymentsDbContext>();

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