using Microsoft.Extensions.DependencyInjection;
using Zeta.UI.Transformers.Html;

namespace Zeta.UI.Transformers;

public static class DependencyInjection
{
    // ReSharper disable once InconsistentNaming
    public static void AddZetaUITransformation(this IServiceCollection services)
    {
        services.AddTransient<ITransformer, RichTextTransformer>();
        services.AddTransient<ITransformer, TextSpanTransformer>();
        
        services.AddTransient<ITransformerService, HtmlTransformerService>();
        services.AddTransient<VisitorService>();
    }
}