using DomainFixture;
using Zoo.Payments.ValueObjects;

namespace Zoo.Payments.Tests.DomainFixture.Configurations.ValueObjects;

public class EmailAddressConfiguration : FixtureConfiguration<EmailAddress>
{
    public override void Configure()
    {
        Property(x => x.Email)
            .Empty().IsInvalid()
            .Valid("foo@bar.dk")
            .Invalid("foobar");
    }
}