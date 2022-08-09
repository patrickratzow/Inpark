using DomainFixture;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Tests.DomainFixture.Configurations.ValueObjects;

public class EmailAddressConfiguration : FixtureConfiguration<EmailAddress>
{
    public override void Configure()
    {
        Property(x => x.Value)
            .Valid("test@test.com");
    }
}