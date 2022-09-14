namespace Zeta.UI.Intermediate;

public abstract record IntermediateNode(
    string Type
)
{
    private readonly List<IntermediateNode> _children = new();
    public IReadOnlyList<IntermediateNode> Children => _children;

    public IntermediateNode AddChild(IntermediateNode child)
    {
        _children.Add(child);
        
        return this;
    }
}