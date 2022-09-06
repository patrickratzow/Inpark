namespace Zeta.UI.Intermediate.Nodes;

public record ImageNode(
    string Type,
    string Source,
    string? Alt,
    bool? EnableFullscreenView
) : IntermediateNode(Type);