namespace Zeta.UI.Mappers.Umbraco.Transformers;

public class ImageTransformer : ITransformer
{
    private readonly ConfigurationService _config;

    public ImageTransformer(ConfigurationService config)
    {
        _config = config;
    }

    public ValueTask<bool> ShouldTransform(ParsingNode node) => ValueTask.FromResult(node.Type is NodeTypes.Image);

    public ValueTask<SDUINode> Transform(ParsingNode node)
    {
        var json = node.Value;
        var alt = json.GetProperty("alt").ToString();
        var url = json.GetProperty("image").ToString();
        var imageUrl = _config.JoinUrl(url);

        throw new NotImplementedException();
    }
}