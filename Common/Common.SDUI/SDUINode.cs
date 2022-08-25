namespace Zeta.Inpark.Common.SDUI;

public class SDUINode
{
    public string? InnerText { get; private set; }
    public string Name { get; }
    public Dictionary<string, string> Attributes { get; }
    public List<SDUINode> Children { get; }
    
    public SDUINode(
        string name,
        string? innerText = null,
        Dictionary<string, string>? attributes = null,
        List<SDUINode>? children = null)
    {
        InnerText = innerText;
        Name = name;
        Attributes = attributes ?? new Dictionary<string, string>();
        Children = children ?? new List<SDUINode>();
    }

    public void AddChild(SDUINode child)
    {
        Children.Add(child);
    }
    
    public void SetAttribute(string key, string value)
    {
        Attributes[key] = value;
    }

    public void SetText(string text, bool shouldTranslate = true)
    {
        InnerText = shouldTranslate ? $"z-translate({text})" : text;
    }
}