using DomainFixture;
using Zeta.Inpark.Food.ValueObjects;

namespace Zeta.Inpark.Food.Tests.DomainFixture.Configurations.ValueObjects;

public class PriceConfiguration : FixtureConfiguration<Price>
{
    public override void Configure()
    {
        Property(x => x.Value)
            .GreaterThanOrEquals(0).IsValid();
    }
}