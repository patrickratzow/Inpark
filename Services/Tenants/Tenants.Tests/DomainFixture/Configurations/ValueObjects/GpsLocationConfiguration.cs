using DomainFixture;
using Zeta.Inpark.Tenants.ValueObjects;

namespace Zeta.Inpark.Tenants.Tests.DomainFixture.Configurations.ValueObjects;

public class GpsLocationConfiguration : FixtureConfiguration<GpsLocation>
{
    public override void Configure()
    {
        Property(x => x.X)
            .LessThanOrEquals(100).IsValid()
            .GreaterThanOrEquals(0).IsValid();
        
        Property(x => x.Y)
            .LessThanOrEquals(100).IsValid()
            .GreaterThanOrEquals(0).IsValid();
    }
}