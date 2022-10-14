using System.Reflection;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Zeta.Common.Api;

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
}