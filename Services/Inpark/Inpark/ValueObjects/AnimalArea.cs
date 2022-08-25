using Zeta.Inpark.Common;

namespace Zeta.Inpark.ValueObjects;

public class AnimalArea : ValueObject
{
    public string Color { get; private set; } = null!;
    public List<Point> Points { get; private set; } = new();

    private AnimalArea(){}

    public static AnimalArea From(string color, List<Point> points)
    {
        var instance = new AnimalArea()
        {
            Color = color,
            Points = points
        };
        instance.Validate();

        return instance;
    }

    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return Color;
        yield return Points;
    }
}

public class AnimalAreaValidator : AbstractValidator<AnimalArea>
{
    public AnimalAreaValidator()
    {
        RuleFor(x => x.Color).NotEmpty().Length(6);
        RuleFor(x => x.Points).NotEmpty();
    }
}