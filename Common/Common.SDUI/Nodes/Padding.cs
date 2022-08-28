namespace Zeta.Inpark.Common.SDUI;

public class Padding : SDUINode
{
    public Padding(EdgeInsets insets) : base("Padding")
    {
        SetAttribute("all", insets.ToString());
    }
}

public record EdgeInsets(
    double LeftValue,
    double TopValue,
    double RightValue,
    double BottomValue
)
{
    public static EdgeInsets Zero => new(0, 0, 0, 0);
    public static EdgeInsets All(double value) => new(value, value, value, value);
    // ReSharper disable once InconsistentNaming
    public static EdgeInsets FromLTRB(double left, double top, double right, double bottom) => new(left, top, right, bottom);
    public static EdgeInsets Top(double value) => new(0, value, 0, 0);
    public static EdgeInsets Right(double value) => new(0, 0, value, 0);
    public static EdgeInsets Left(double value) => new(value, 0, 0, 0);
    public static EdgeInsets Bottom(double value) => new(0, 0, 0, value);

    public override string ToString() => $"{TopValue},{RightValue},{BottomValue},{LeftValue}";
}
