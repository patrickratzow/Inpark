namespace Zeta.UI.Mappers;

public interface ITransformer
{
    bool ShouldTransform(ParsingNode node);
    SDUINode Transform(ParsingNode node);
}