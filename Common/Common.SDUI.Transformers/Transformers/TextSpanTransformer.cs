using HtmlAgilityPack;

namespace Zeta.Inpark.Common.SDUI.Transformers;

public class TextSpanTransformer : ITransformer
{
    public Priority Priority => Priority.Lowest;
    
    public bool ShouldTransform(HtmlNode node) => true;

    public ValueTask<SDUINode> Transform(HtmlNode node)
    {
        var textSpan = new TextSpan();
        textSpan.SetText(node.InnerText);
        
        return new(textSpan);
    }
}