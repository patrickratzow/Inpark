using System.Text.Json;

namespace Zeta.UI;

public class FullscreenImageAction : SDUIAction
{
    public override string Id => "fullscreenImage";
    private readonly Parameters _data;
    public override string Data => JsonSerializer.Serialize(_data, new JsonSerializerOptions
    {
        WriteIndented = false, 
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase
    });
    public override bool DataIsAttribute => false;
    
    public FullscreenImageAction(Parameters parameters)
    {
        _data = parameters;
    }

    public record Parameters(
        string PreviewImageUrl,
        string FullscreenImageUrl,
        string Title,
        string Tag,
        bool Hide
    );
}