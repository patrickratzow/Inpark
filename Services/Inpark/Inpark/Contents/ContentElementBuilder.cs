namespace Zeta.Inpark.Contents;

public class ContentElementBuilder
{
    private readonly string _name;
    private readonly Dictionary<string, string> _attributes = new();
    private readonly List<ContentElement> _children = new();
    private string? _innerText;

    public ContentElementBuilder(string name) { _name = name; }
    
    public ContentElementBuilder AddAttribute(string name, string value)
    {
        _attributes.Add(name, value);
        
        return this;
    }
    
    public ContentElementBuilder AddChild(ContentElement child)
    {
        _children.Add(child);
        
        return this;
    }
    
    public ContentElementBuilder SetInnerText(string text)
    {
        _innerText = text;
        
        return this;
    }
    
    public ContentElement Build()
    {
        return new ContentElement(_name, _attributes, _children, _innerText);
    }
}