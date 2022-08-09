using DomainFixture;
using Zeta.Inpark.Auth.Entities;

namespace Zeta.Inpark.Auth.Tests.DomainFixture.Configurations.Entities;

public class AdminConfiguration : FixtureConfiguration<Admin>
{
    public override void Configure()
    {
        Property(x => x.LastSeen)
            .ShouldBeInThePast();
    }
}