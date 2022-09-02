using HtmlAgilityPack;

namespace Zeta.Inpark.Common.SDUI.Transformers;

public interface IVisitor<in T>
{
    void Visit(T node, HtmlNode htmlNode);
}
