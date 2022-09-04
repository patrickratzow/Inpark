using HtmlAgilityPack;

namespace Zeta.UI.Transformers.Html;

public interface ITransformer
{
    Priority Priority { get; }
    bool ShouldTransform(HtmlNode node);
    ValueTask<SDUINode> Transform(HtmlNode node);
}