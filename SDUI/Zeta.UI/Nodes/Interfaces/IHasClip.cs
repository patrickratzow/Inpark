namespace Zeta.UI;

public interface IHasClip
{
}

public static class HasClipExtensions
{
    public static void SetClip(
        this IHasClip sduiNode,  
        Clip clip, 
        string key = "clip")
    {
        if (sduiNode is not SDUINode node) return;

        node.SetAttribute(key, clip.ToCamelCase());

        node.SetInternalData("clip", key, clip);
    }
    
    public static InternalData<Clip>? GetClip(this IHasClip sduiNode)
    {
        if (sduiNode is not SDUINode node) return null;

        return node.GetInternalData<Clip>("clip");
    }
}