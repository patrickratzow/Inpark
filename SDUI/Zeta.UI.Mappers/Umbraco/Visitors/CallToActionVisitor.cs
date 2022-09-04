namespace Zeta.UI.Mappers.Umbraco.Visitors;

public class CallToActionVisitor : IVisitor
{
    public bool ShouldVisit(SDUINode node, ParsingNode parsingNode)
        => parsingNode.Type is NodeTypes.CallToAction && node is IHasAction;

    public void Visit(SDUINode node, ParsingNode parsingNode)
    {
        var url = parsingNode.Value.GetProperty("externalPage").ToString();

        var openUrlAction = new OpenUrlAction(url);
        ((IHasAction)node).SetAction("action", openUrlAction);
    }
}