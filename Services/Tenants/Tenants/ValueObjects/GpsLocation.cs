using FluentValidation;
using Zeta.Inpark.Tenants.Common;

namespace Zeta.Inpark.Tenants.ValueObjects;

public class GpsLocation : ValueObject
{
    public double X { get; private set; } 
    public double Y { get; private set; }
    
    private GpsLocation(){}

    public static GpsLocation From(double x, double y)
    {
        var instance = new GpsLocation
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

public class GpsLocationValidator : AbstractValidator<GpsLocation>
{
    public GpsLocationValidator()
    {
        RuleFor(x => x.X)
            .LessThanOrEqualTo(100)
            .GreaterThanOrEqualTo(0);
        RuleFor(x => x.Y)            
            .LessThanOrEqualTo(100)
            .GreaterThanOrEqualTo(0);
    }
}