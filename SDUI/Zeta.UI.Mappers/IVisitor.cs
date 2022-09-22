using Zeta.UI.Intermediate;

namespace Zeta.UI.Mappers;

public interface IVisitor
{
}

public interface IVisitor<in T> : IVisitor where T : IntermediateNode
{
    bool ShouldVisit(SDUINode node, T intermediateNode) => true;
    void Visit(SDUINode node, T intermediateNode);
}