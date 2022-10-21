using DomainFixture;
using Zeta.Inpark.Food.Entities;

namespace Zeta.Inpark.Food.Tests.DomainFixture.Configurations.Entities;

public class ShopConfiguration : FixtureConfiguration<Shop>
{
    public override void Configure()
    {
        Property(x => x.Name)
            .Length(1, 255).IsValid();
        
        Property(x => x.Description)
            .Length(1, 4096).IsValid();
    }
}