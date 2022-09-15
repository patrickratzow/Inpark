using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Zeta.Inpark.Translator.Contracts;

namespace Zeta.Common.Api.Translator;

public static class TranslatorDependencyInjection
{
    public static void AddTranslator(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddTranslatorService(configuration);
        services.TryAddScoped<ITranslationService, TranslationService>();
    }
    
    public static void UseTranslator(this IApplicationBuilder app)
    {
        app.Use(async (context, next) =>
        {
            var translationService = context.RequestServices.GetRequiredService<ITranslationService>();
            var translationHeader = context.Request.Headers["X-Language"].ToString();

            translationService.CurrentTranslation = string.IsNullOrWhiteSpace(translationHeader) 
                ? null 
                : translationHeader;
            
            await next(context);
        });
    }
}
