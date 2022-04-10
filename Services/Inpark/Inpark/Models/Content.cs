namespace Zoo.Inpark.Models;

public static class ContentType
{
    public const string Text = "text";
    public const string HeadLine = "headline";
    public const string Image = "image";
    public const string Header = "header";
}

public interface IContainer
{
    public List<IContainer> Children { get; set; }
}

public interface IContent : IContainer
{
    public string Type { get; set; }
}

public abstract class Content : Container, IContent
{
    public string Type { get; set; } = null!;

    protected Content(string type, List<IContainer>? children = null) : base(children)
    {
        Type = type;
    }
}

public class AnimalContent : Container, IContent
{
    public object Value { get; set; }
    public string Type { get; set; }
    

    public AnimalContent(object value, string type)
    {
        Value = value;
        Type = type;
    }
}

public class Container : IContainer
{
    public List<IContainer> Children { get; set; }
    
    public Container(List<IContainer>? children = null)
    {
        Children = children ?? new();
    }
}

public class ListAnimalContent : Content
{
    public ListAnimalContent(IEnumerable<Content> contents) : base("list", new(contents))
    {
    }
    
    public static ListAnimalContent WithPoints(IEnumerable<string> values)
    {
        var contents = values
            .Select(str => new AnimalContent(str, "text"))
            .Cast<Content>()
            .ToList();

        return new(contents);
    }
}