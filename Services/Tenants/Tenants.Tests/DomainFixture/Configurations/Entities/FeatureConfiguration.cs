using DomainFixture;
using Zeta.Inpark.Tenants.Entities;

namespace Zeta.Inpark.Tenants.Tests.DomainFixture.Configurations.Entities;

public class FeatureConfiguration : FixtureConfiguration<Feature>
{
    public override void Configure()
    {
        Property(x => x.FeatureId)
            .Length(1, 255).IsValid()
            .Empty().IsInvalid();
        
        Property(x => x.DeactivatedAt)
            .ShouldBeInThePast();
        
        Property(x => x.Data)
            .Length(1).IsValid()
            .Empty().IsInvalid();
    }
}