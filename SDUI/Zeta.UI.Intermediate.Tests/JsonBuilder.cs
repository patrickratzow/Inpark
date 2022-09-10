namespace Zeta.UI.Intermediate.Tests;

public class JsonBuilder
{
    private readonly Dictionary<string, string> _properties = new();
    
    private JsonBuilder() {}
    
    public static JsonBuilder FromJson(string json)
    {
        var builder = new JsonBuilder();
        var jsonElement = JsonDocument.Parse(json).RootElement;
        foreach (var property in jsonElement.EnumerateObject())
        {
            builder._properties.Add(property.Name, property.Value.ToString());
        }

        return builder;
    }
    
    public bool Remove(string key) => _properties.Remove(key);
    public void Add(string key, string value) => _properties.Add(key, value);

    public JsonElement ToElement()
    {
        var json = ToString();
        
        return JsonDocument.Parse(json).RootElement;
    }

    public static implicit operator JsonElement(JsonBuilder b) => b.ToElement();
    
    public override string ToString() =>
$@"{{
    {string.Join(",\n   ", _properties.Select(x => @$"""{x.Key}"": ""{x.Value}"""))}
}}
";
}