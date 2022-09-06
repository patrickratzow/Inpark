using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Zeta.Inpark.Translator.Contracts;

public static class DependencyInjection
{
    public static void AddTranslatorService(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddSingleton<ITranslatorService, TranslatorService>(sp =>
        {
            var logger = sp.GetRequiredService<ILogger<TranslatorService>>();
            var memoryCache = sp.GetRequiredService<IMemoryCache>();
            var baseUrl = configuration["Translator:BaseUrl"];
            
            return new(logger, memoryCache, baseUrl);
        });
    }
}
