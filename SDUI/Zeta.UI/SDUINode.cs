namespace Zeta.UI;

// ReSharper disable once InconsistentNaming
public class SDUINode
{
    private Dictionary<string, object> InternalData { get; }
    public string? InnerText { get; private set; }
    public string Name { get; }
    public Dictionary<string, string> Attributes { get; }

    private readonly List<SDUINode> _children;
    public IReadOnlyList<SDUINode> Children => _children;


    public SDUINode(
        string name,
        string? innerText = null,
        Dictionary<string, string>? attributes = null,
        List<SDUINode>? children = null)
    {
        InnerText = innerText;
        Name = name;
        Attributes = attributes ?? new Dictionary<string, string>();
        _children = children ?? new List<SDUINode>();
        InternalData = new();
    }

    public void SetAttribute(string key, string value)
    {
        Attributes[key] = value;
    }

    public void SetText(string text)
    {
        InnerText = text;
    }

    public void SetDebug(string text)
    {
        SetAttribute("z-debug", text);
    }
    
    public void SetParent(SDUINode parent)
    {
        parent.AddChild(this);
    }

    public void ShouldNotTranslate()
    {
        if (!Attributes.TryGetValue("class", out var classString))
        {
            classString = string.Empty;
        }

        var classSplit = classString.Trim().Split(" ").ToList();
        classSplit.Add("notranslate");

        SetAttribute("class", string.Join(" ", classSplit));
    }

    protected virtual void AddChild(SDUINode child)
    {
        _children.Add(child);
    }

    public override string ToString() 
        => $"<{Name} {string.Join(" ", Attributes.Select(x => $"{x.Key}=\"{x.Value}\""))}>{InnerText}</{Name}>";
    
    internal void SetInternalData<T>(string key, string internalKey, T data) 
        => InternalData[key] = new InternalData<T>(internalKey, data);
    internal InternalData<T>? GetInternalData<T>(string key) 
        => InternalData.TryGetValue(key, out var data) ? (InternalData<T>)data : default;
}

public record InternalData<T>(
    string Key,
    T Value
);