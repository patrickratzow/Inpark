namespace Zeta.Inpark.Common.SDUI;

public interface IHasTextWeight
{
}

public static class HasTextWeightExtensions
{
    public static void SetTextWeight(
        this IHasTextWeight sduiNode,
        TextWeight weight,
        string key = "weight")
    {
        if (sduiNode is not SDUINode node) return;

        node.SetAttribute(key, weight switch
        {
            TextWeight.Bold => "bold",
            TextWeight.Normal => "500",
            TextWeight.Light => "400",
            _ => weight.ToCamelCase()
        });

        node.SetInternalData("text-weight", key, weight);
    }

    public static InternalData<TextWeight>? GetTextWeight(this IHasTextWeight sduiNode)
    {
        if (sduiNode is not SDUINode node) return null;

        return node.GetInternalData<TextWeight>("text-weight");
    }
}