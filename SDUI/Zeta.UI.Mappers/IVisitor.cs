namespace Zeta.UI.Mappers;

public interface IVisitor
{
    bool ShouldVisit(SDUINode node, ParsingNode parsingNode);
    void Visit(SDUINode node, ParsingNode parsingNode);
}