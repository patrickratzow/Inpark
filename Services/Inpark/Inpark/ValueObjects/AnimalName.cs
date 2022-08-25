using Zeta.Inpark.Common;

namespace Zeta.Inpark.ValueObjects;

public class AnimalName : ValueObject
{
    private AnimalName() { }

    public string Name { get; private set; } = null!;
    public string LatinName { get; private set; } = null!;
    
    public static AnimalName From(string name, string latinName)
    {
        var instance = new AnimalName()
        {
            Name = name.Trim(),
            LatinName = latinName.Trim()
        };
        instance.Validate();

        return instance;
    }

    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return Name;
        yield return LatinName;
    }
}

public class AnimalNameValidator : AbstractValidator<AnimalName>
{
    public AnimalNameValidator()
    {
        RuleFor(x => x.Name).NotEmpty().MaximumLength(512);
        RuleFor(x => x.LatinName).NotEmpty().MaximumLength(512);
    }
}
