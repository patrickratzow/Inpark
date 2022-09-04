using HtmlAgilityPack;

namespace Zeta.UI.Transformers.Html;

public interface IVisitor
{
}

public interface IVisitor<in T> : IVisitor
{
    void Visit(T node, HtmlNode htmlNode);
}
