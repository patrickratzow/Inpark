using System.Collections.Generic;
using DomainFixture;
using Zeta.Inpark.Tenants.Entities;

namespace Zeta.Inpark.Tenants.Tests.DomainFixture.Configurations.Entities;

public class ServiceConfiguration : FixtureConfiguration<Service>
{
    public override void Configure()
    {
        Property(x => x.ServiceId)
            .Length(1, 255).IsValid()
            .Empty().IsInvalid();

        Property(x => x.DeactivatedAt)
            .ShouldBeInThePast();

        Property(x => x.Features).Valid(new List<Feature>());
    }
}