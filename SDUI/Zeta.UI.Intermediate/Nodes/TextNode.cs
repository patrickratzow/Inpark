namespace Zeta.UI.Intermediate.Nodes;

public record TextNode(
    string Text,
    TextKind Kind,
    bool IsHeader
) : IntermediateNode(NodeTypes.Text);

public enum TextKind
{
    Text,
    Html
}