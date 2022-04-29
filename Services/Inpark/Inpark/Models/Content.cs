namespace Zoo.Inpark.Models;

public static class ContentType
{
    public const string Text = "text";
    public const string HeadLine = "headline";
    public const string Image = "image";
    public const string Header = "header";
    public const string ListItem = "listitem";
    public const string CallToAction = "callToAction";
}

public static class LayoutType
{
    public const string Container = "container";
    public const string Spacer = "spacer";
    public const string List = "list";

}
public interface IContainer
{
    public IEnumerable<Content> Children { get; set; }
}

public interface IContent : IContainer
{
    public object Value { get; set; }
    public string Type { get; set; }
}

public class Content : Container, IContent
{
    public object Value { get; set; }
    public string Type { get; set; }

    public Content(object value, string type, IEnumerable<Content>? children = null) : base(children)
    {
        Value = value;
        Type = type;
        Children = children ?? Array.Empty<Content>();
    }
}

public class ContentLayout : Content
{
    public ContentLayout(ContentLayoutOptions? value = null, string? type = null) 
        : base(value ?? new(), type ?? LayoutType.Container)
    {
    }
}

public class ContentLayoutOptions
{
}

public class Container : IContainer
{
    public IEnumerable<Content> Children { get; set; }
    
    public Container(IEnumerable<Content>? children = null)
    {
        Children = children ?? Array.Empty<Content>();
    }
}