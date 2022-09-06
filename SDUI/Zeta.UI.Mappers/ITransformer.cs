namespace Zeta.UI.Mappers;

public interface ITransformer
{
    ValueTask<bool> ShouldTransform(ParsingNode node);
    ValueTask<SDUINode> Transform(ParsingNode node);
}