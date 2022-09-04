using HtmlAgilityPack;

namespace Zeta.UI.Transformers.Html.Visitors;

public class TextWeightVisitor : IVisitor<IHasTextWeight>
{
    public void Visit(IHasTextWeight node, HtmlNode htmlNode)
    {
        if (htmlNode.Name is not "strong" or "b")
        {
            node.SetTextWeight(TextWeight.Normal);
            
            return;
        }
        
        node.SetTextWeight(TextWeight.Bold);
    }
}