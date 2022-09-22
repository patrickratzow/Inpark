using Microsoft.Extensions.DependencyInjection;
using Zeta.UI.Intermediate.Nodes;
using Zeta.UI.Mappers.Transformers;

namespace Zeta.UI.Mappers;

public static class DependencyInjection
{
    // ReSharper disable once InconsistentNaming
    public static void AddZetaUIMappers(this IServiceCollection services)
    {
        services.AddSingleton<IUseCaseOptions, DefaultUseCaseOptions>();
        services.AddSingleton<ITransformer<ImageNode>, ImageTransformer>();
        services.AddSingleton<ITransformer<TextNode>, TextTransformer>();
        services.AddSingleton<ITransformer<SectionNode>, WrapperTransformer>();
        services.AddSingleton<ITransformer<RootNode>, WrapperTransformer>();
        services.AddSingleton<ITransformer<CallToActionNode>, CallToActionTransformer>();

        services.AddTransient<IMapper, Mapper>();
        services.AddTransient<FeatureConfig>(sp => new()
        {
            BaseUrl = "https://cms.aalborgzoo.dk"
        });
        services.AddTransient<ConfigurationService>();
    }
}
