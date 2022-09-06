namespace Zeta.UI.Intermediate.Nodes;

public record LinkNode(
    string Url,
    string Text
) : IntermediateNode(NodeTypes.Link);
