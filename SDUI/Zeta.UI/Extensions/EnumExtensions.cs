namespace Zeta.UI;

public static class EnumExtensions
{
    public static string ToCamelCase<T>(this T @enum) where T : struct, Enum
    {
        var enumName = Enum.GetName(@enum);
        var camelCase = enumName![..1].ToLower() + enumName[1..];

        return camelCase;
    }
}