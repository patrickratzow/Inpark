using System.Globalization;

namespace Zeta.Inpark.Auth.ValueObjects;

public class Color : ValueObject
{
    public string Value { get; private set; } = null!;
    
    private Color() { }
    
    public static Color From(string color)
    {
        var instance = new Color
        {
            Value = color
        };
        instance.Validate();

        return instance;
    }

    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return Value;
    }
}

public class ColorValidator : AbstractValidator<Color>
{
    public ColorValidator()
    {
        RuleFor(x => x.Value)
            .NotEmpty()
            .Length(6, 7)
            // Used to check if the string is a valid hex color
            .Must(x => int.TryParse(x, NumberStyles.HexNumber, CultureInfo.InvariantCulture, out _));
    }
}