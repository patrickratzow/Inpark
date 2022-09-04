using HtmlAgilityPack;

namespace Zeta.UI.Transformers.Html.Visitors;

public class FontStyleVisitor : IVisitor<IHasFontStyle>
{
    public void Visit(IHasFontStyle node, HtmlNode htmlNode)
    {
        if (htmlNode.Name is not "em" or "i")
        {
            node.SetFontStyle(FontStyle.Normal);

            return;
        }

        node.SetFontStyle(FontStyle.Italic);
    }
}