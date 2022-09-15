namespace Zeta.UI.Intermediate.Nodes;

public record ImageNode(
    string Source,
    string? Alt,
    ImageMetadata Metadata,
    bool EnableFullscreenView = true
) : IntermediateNode(NodeTypes.Image);

public record ImageMetadata(
    int? Width = null,
    int? Height = null
);