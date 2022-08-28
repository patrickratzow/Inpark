namespace Zeta.Inpark.Common.SDUI;

public abstract class BorderRadius
{
    protected BorderRadius()
    {
    }
    
    public static BorderRadius Circular(int radius)
    {
        return new CircularBorderRadius(radius);
    }

    public abstract override string ToString();
}

public class CircularBorderRadius : BorderRadius
{
    private readonly int _radius;

    public CircularBorderRadius(int radius)
    {
        _radius = radius;
    }

    public override string ToString()
    {
        return $"{_radius}";
    }
}