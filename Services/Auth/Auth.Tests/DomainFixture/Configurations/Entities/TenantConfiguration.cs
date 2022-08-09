using DomainFixture;
using Tenant = Zeta.Inpark.Auth.Entities.Tenant;

namespace Zeta.Inpark.Auth.Tests.DomainFixture.Configurations.Entities;

public class TenantConfiguration : FixtureConfiguration<Tenant>
{
    public override void Configure()
    {
        Property(x => x.Name)
            .Length(1).IsValid()
            .Empty().IsInvalid();
    }
}