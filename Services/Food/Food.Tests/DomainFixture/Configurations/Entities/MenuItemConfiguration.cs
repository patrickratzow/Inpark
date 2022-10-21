using DomainFixture;
using Zeta.Inpark.Food.Entities;

namespace Zeta.Inpark.Food.Tests.DomainFixture.Configurations.Entities;

public class MenuItemConfiguration : FixtureConfiguration<MenuItem>
{
    public override void Configure()
    {
        Property(x => x.Name)
            .Length(1, 255).IsValid();
    }
}