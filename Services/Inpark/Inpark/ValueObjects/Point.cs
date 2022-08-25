using Zeta.Inpark.Common;

namespace Zeta.Inpark.ValueObjects;

public class Point : ValueObject
{
    public double X { get; private set; } 
    public double Y { get; private set; }
    
    private Point(){}
    public static Point From(double x, double y)
    {
        var instance = new Point()
        {
            X = x,
            Y = y
        };
        instance.Validate();

        return instance;
    }
    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return X;
        yield return Y;
    }
}

public class PointValidator : AbstractValidator<Point>
{
    public PointValidator()
    {
        RuleFor(x => x.X)
            .LessThanOrEqualTo(100)
            .GreaterThanOrEqualTo(0);
        RuleFor(x => x.Y)            
            .LessThanOrEqualTo(100)
            .GreaterThanOrEqualTo(0);
    }
}