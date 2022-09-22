namespace Zeta.UI;

public class Image : SDUINode
{
    public Image(string url, string? alt = null, int? width = null, int? height = null) : base("Image")
    {
        SetAttribute("src", url);
        
        if (!string.IsNullOrWhiteSpace(alt))
        {
            SetAttribute("alt", alt);
        }
        if (width.HasValue)
        {
            SetAttribute("width", width.Value.ToString());
        }
        if (height.HasValue)
        {
            SetAttribute("height", height.Value.ToString());
        }
    }
}