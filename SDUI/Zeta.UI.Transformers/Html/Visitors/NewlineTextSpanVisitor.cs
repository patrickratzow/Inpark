using HtmlAgilityPack;

namespace Zeta.UI.Transformers.Html.Visitors;

public class NewlineTextSpanVisitor : IVisitor<TextSpan>
{
    public void Visit(TextSpan node, HtmlNode htmlNode)
    {
        if (htmlNode.Name is not "br" && htmlNode.InnerText is not "\n") return;
        
        node.SetText("\n\n");
    }
}