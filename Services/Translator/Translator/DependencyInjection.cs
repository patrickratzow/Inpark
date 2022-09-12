using System.Reflection;
using FluentValidation;
using MediatR;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using StackExchange.Redis;
using Zeta.Inpark.Translator.Models;
using Zeta.Inpark.Translator.Services;
using Zoo.Common.Api;

namespace Zeta.Inpark.Translator;

public static class DependencyInjection
{
    public static void AddTranslator(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddMediatR(Assembly.GetExecutingAssembly());
        services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());

        services.AddPipelines();

        services.AddSingleton<ITranslator, AzureTranslator>();
        services.AddSingleton<IConnectionMultiplexer>(ConnectionMultiplexer.Connect(configuration.GetConnectionString("Cache")));

        services.Configure<AzureTranslatorOptions>(options =>
        {
            const string position = AzureTranslatorOptions.Position;

            options.Endpoint = configuration[$"{position}:{nameof(AzureTranslatorOptions.Endpoint)}"];
            options.Region = configuration[$"{position}:{nameof(AzureTranslatorOptions.Region)}"];
            options.ResourceKey = configuration[$"{position}:{nameof(AzureTranslatorOptions.ResourceKey)}"];
        });
    }
}
