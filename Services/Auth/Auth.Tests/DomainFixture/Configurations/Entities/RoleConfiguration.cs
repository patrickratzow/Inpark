using DomainFixture;
using Zeta.Inpark.Auth.Entities;

namespace Zeta.Inpark.Auth.Tests.DomainFixture.Configurations.Entities;

public class RoleConfiguration : FixtureConfiguration<Role>
{
    public override void Configure()
    {
        Property(x => x.Name)
            .Length(1, 255).IsValid();
    }
}