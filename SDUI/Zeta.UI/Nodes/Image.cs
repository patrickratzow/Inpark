namespace Zeta.UI;

public class Image : SDUINode
{
    public Image(string url, string? alt) : base("Image")
    {
        SetAttribute("src", url);
        
        if (!string.IsNullOrWhiteSpace(alt))
        {
            SetAttribute("alt", alt);
        }
    }
}