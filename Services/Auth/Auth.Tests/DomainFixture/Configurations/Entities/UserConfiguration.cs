using DomainFixture;
using Zeta.Inpark.Auth.Entities;

namespace Zeta.Inpark.Auth.Tests.DomainFixture.Configurations.Entities;

public class UserConfiguration : FixtureConfiguration<User>
{
    public override void Configure()
    {
        Property(x => x.UserId)
            .Length(1).IsValid()
            .Empty().IsInvalid();

        Property(x => x.DisplayName)
            .Length(1).IsValid()
            .Empty().IsInvalid();
    }
}