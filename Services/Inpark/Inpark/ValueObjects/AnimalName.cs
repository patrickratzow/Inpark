using Zeta.Inpark.Common;

namespace Zeta.Inpark.ValueObjects;

public class AnimalName : ValueObject
{
    private AnimalName() { }

    public string DisplayName { get; private set; } = null!;
    public string LatinName { get; private set; } = null!;
    
    public static AnimalName From(string name, string latinName)
    {
        var instance = new AnimalName()
        {
            DisplayName = name.Trim(),
            LatinName = latinName.Trim()
        };
        instance.Validate();

        return instance;
    }

    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return DisplayName;
        yield return LatinName;
    }
}

public class AnimalNameValidator : AbstractValidator<AnimalName>
{
    public AnimalNameValidator()
    {
        RuleFor(x => x.DisplayName).NotEmpty().MaximumLength(512);
        RuleFor(x => x.LatinName).NotEmpty().MaximumLength(512);
    }
}
