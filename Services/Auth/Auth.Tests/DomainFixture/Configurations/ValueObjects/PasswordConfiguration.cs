using DomainFixture;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Tests.DomainFixture.Configurations.ValueObjects;

public class PasswordConfiguration : FixtureConfiguration<Password>
{
    public override void Configure()
    {
        Property(x => x.Hash)
            .Length(1).IsValid()
            .Empty().IsInvalid();
        
        Property(x => x.Salt)
            .Length(1).IsValid()
            .Empty().IsInvalid();
    }
}