using DomainFixture;
using Zeta.Inpark.ValueObjects;

namespace Zeta.Inpark.Tests.DomainFixture.Configurations.ValueObjects;

public class AnimalNameConfiguration : FixtureConfiguration<AnimalName>
{
    public override void Configure()
    {
        Property(x => x.DisplayName)
            .Length(1, 512).IsValid()
            .Empty().IsInvalid();
        
        Property(x => x.LatinName)
            .Length(1, 512).IsValid()
            .Empty().IsInvalid();
    }
}