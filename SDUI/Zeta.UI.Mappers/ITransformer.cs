using Zeta.UI.Intermediate;

namespace Zeta.UI.Mappers;

public interface ITransformer
{
}

public interface ITransformer<in T> : ITransformer where T : IntermediateNode
{
    ValueTask<bool> ShouldTransform(T node) => new(true);
    ValueTask<SDUINode> Transform(T node);
}