using System.Reflection;
using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Zoo.Common.Api;

namespace Zeta.Inpark.Maps;

public static class DependencyInjection
{
    public static IServiceCollection AddMaps(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("MapsDatabase");
        services.AddDbContext<MapsDbContext>(opts =>
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