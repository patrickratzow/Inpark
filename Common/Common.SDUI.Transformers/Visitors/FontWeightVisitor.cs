using HtmlAgilityPack;

namespace Zeta.Inpark.Common.SDUI.Transformers.Visitors;

public class FontWeightVisitor : IVisitor<IHasTextWeight>
{
    public void Visit(IHasTextWeight node, HtmlNode htmlNode)
    {
        if (htmlNode.Name is not "strong" or "b") return;
        
        node.SetTextWeight(TextWeight.Bold);
    }
}