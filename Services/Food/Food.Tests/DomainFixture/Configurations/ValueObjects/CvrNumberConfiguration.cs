using DomainFixture;
using Zeta.Inpark.Food.ValueObjects;

namespace Zeta.Inpark.Food.Tests.DomainFixture.Configurations.ValueObjects;

public class CvrNumberConfiguration : FixtureConfiguration<CvrNumber>
{
    public override void Configure()
    {
        Property(x => x.Value)
            .Length(8).Numerical().IsValid()
            .Length(8).Alphabetical().IsInvalid();
    }
}