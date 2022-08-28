namespace Zeta.Inpark.Common.SDUI;

public interface IHasBorderRadius
{
}

public static class HasBorderRadiusExtensions
{
    public static void SetBorderRadius(
        this IHasBorderRadius sduiNode,  
        BorderRadius borderRadius, 
        string key = "border-radius")
    {
        if (sduiNode is not SDUINode node) return;

        node.SetAttribute(key, borderRadius.ToString());

        node.SetInternalData("border-radius", key, borderRadius);
    }
    
    public static InternalData<BorderRadius>? GetBorderRadius(this IHasAction sduiNode)
    {
        if (sduiNode is not SDUINode node) return null;

        return node.GetInternalData<BorderRadius>("border-radius");
    }
}