using DomainFixture;
using Zeta.Inpark.Food.ValueObjects;

namespace Zeta.Inpark.Food.Tests.DomainFixture.Configurations.ValueObjects;

public class MerchantNameConfiguration : FixtureConfiguration<MerchantName>
{
    public override void Configure()
    {
        Property(x => x.Value)
            .Length(1, 255).IsValid();
    }
}