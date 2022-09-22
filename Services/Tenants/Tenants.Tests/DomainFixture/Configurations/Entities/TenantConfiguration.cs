using System.Collections.Generic;
using DomainFixture;
using Zeta.Inpark.Tenants.Entities;

namespace Zeta.Inpark.Tenants.Tests.DomainFixture.Configurations.Entities;

public class TenantConfiguration : FixtureConfiguration<Tenant>
{
    public override void Configure()
    {
        Property(x => x.Name)
            .Length(1, 255).IsValid()
            .Empty().IsInvalid();

        Property(x => x.ImageUrl)
            .Length(1).IsValid()
            .NotEmpty().IsValid();
        
        Property(x => x.Services).Valid(new List<Service>());
    }
}