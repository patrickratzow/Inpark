namespace Zeta.UI.Intermediate.Nodes;

public record CallToActionNode(
    string Url,
    string Text
) : IntermediateNode(NodeTypes.CallToAction);
