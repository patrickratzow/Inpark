using DomainFixture;
using Zeta.Inpark.Auth.Entities;

namespace Zeta.Inpark.Auth.Tests.DomainFixture.Configurations.Entities;

public class RefreshTokenConfiguration : FixtureConfiguration<RefreshToken>
{
    public override void Configure()
    {
        Property(x => x.ExpiresAt)
            .ShouldBeInTheFuture();
    }
}