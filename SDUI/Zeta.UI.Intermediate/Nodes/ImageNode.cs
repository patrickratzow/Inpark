namespace Zeta.UI.Intermediate.Nodes;

public record ImageNode(
    string Source,
    string? Alt,
    bool? EnableFullscreenView
) : IntermediateNode(NodeTypes.Image);