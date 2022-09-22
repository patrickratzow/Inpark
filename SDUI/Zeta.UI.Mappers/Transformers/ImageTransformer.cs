using Zeta.UI.Intermediate.Nodes;

namespace Zeta.UI.Mappers.Transformers;

public class ImageTransformer : ITransformer<ImageNode>
{
    private readonly ConfigurationService _config;

    public ImageTransformer(ConfigurationService config)
    {
        _config = config;
    }

    public ValueTask<SDUINode> Transform(ImageNode node)
    {
        var url = _config.JoinUrl(node.Source);
        var alt = node.Alt;
        var metadata = node.Metadata;
        
        var image = new Image(url, alt, metadata.Width, metadata.Height);
        return new(image);
    }
}