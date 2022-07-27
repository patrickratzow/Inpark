namespace Zoo.Inpark.Contents;

public record ContentElement(
    string Name,
    Dictionary<string, string> Attributes,
    List<ContentElement> Children,
    string? InnerText = null
)
{
    public static ContentElementBuilder Builder(string name) => new(name);
}
