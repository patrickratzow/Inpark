using HtmlAgilityPack;

namespace Zeta.Inpark.Common.SDUI.Transformers;

public class RichTextTransformer : ITransformer
{
    public Priority Priority => Priority.Normal;

    public bool ShouldTransform(HtmlNode node) => node.Name is "p";

    public ValueTask<SDUINode> Transform(HtmlNode node)
    {
        var richText = new RichText();
        var textSpan = new TextSpan();
        textSpan.SetParent(richText);
        
        return new(richText);
    }
}