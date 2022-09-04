namespace Zeta.UI.Mappers;

public interface IMapper
{
    ValueTask<SDUINode> Map(ParsingNode node);
}