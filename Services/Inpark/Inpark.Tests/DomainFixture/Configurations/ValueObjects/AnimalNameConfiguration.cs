using DomainFixture;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Tests.DomainFixture.Configurations.ValueObjects;

public class AnimalNameConfiguration : FixtureConfiguration<AnimalName>
{
    public override void Configure()
    {
        Property(x => x.Name)
            .Length(1, 512).IsValid()
            .Empty().IsInvalid();
        
        Property(x => x.LatinName)
            .Length(1, 512).IsValid()
            .Empty().IsInvalid();
    }
}