using Zeta.UI.Intermediate;
using Zeta.UI.Intermediate.Nodes;

namespace Zeta.UI.Mappers.Transformers;

public class WrapperTransformer : ITransformer<SectionNode>, ITransformer<RootNode>
{
    public ValueTask<SDUINode> Transform(SectionNode node) => GetWrapper(node);
    public ValueTask<SDUINode> Transform(RootNode node) => GetWrapper(node);

    private static ValueTask<SDUINode> GetWrapper(IntermediateNode node)
    {
        var wrapper = new SDUINode("Column");
        wrapper.SetDebug(node.GetType().Name);

        return new(wrapper);
    }
}