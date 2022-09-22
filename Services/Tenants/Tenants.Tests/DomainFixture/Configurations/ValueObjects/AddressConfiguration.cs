using DomainFixture;
using Zeta.Inpark.Tenants.ValueObjects;

namespace Zeta.Inpark.Tenants.Tests.DomainFixture.Configurations.ValueObjects;

public class AddressConfiguration : FixtureConfiguration<Address>
{
    public override void Configure()
    {
        Property(x => x.Street)
            .Length(1).IsValid()
            .Empty().IsInvalid();

        Property(x => x.Number)
            .GreaterThan(0).IsValid()
            .LessThanOrEquals(0).IsInvalid();

        Property(x => x.ZipCode)
            .Length(4).Numerical().IsValid()
            .Length(4).Alphabetical().IsInvalid()
            .Length(3).IsInvalid()
            .Length(5).IsInvalid()
            .Empty().IsInvalid();

        Property(x => x.City)
            .Length(1, 255).IsValid()
            .Empty().IsInvalid();
    }
}