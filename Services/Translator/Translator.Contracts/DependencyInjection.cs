using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Zeta.Inpark.Translator.Contracts;

public static class DependencyInjection
{
    public static void AddTranslatorService(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddSingleton<ITranslatorService, TranslatorService>(sp =>
        {
            var memoryCache = sp.GetRequiredService<IMemoryCache>();
            var baseUrl = configuration["Translator:BaseUrl"];
            
            return new(memoryCache, baseUrl);
        });
    }
}
