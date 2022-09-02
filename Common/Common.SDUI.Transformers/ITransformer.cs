using HtmlAgilityPack;

namespace Zeta.Inpark.Common.SDUI.Transformers;

public interface ITransformer
{
    Priority Priority { get; }
    bool ShouldTransform(HtmlNode node);
    ValueTask<SDUINode> Transform(HtmlNode node);
}