using DomainFixture;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Tests.DomainFixture.Configurations.ValueObjects;

public class ColorConfiguration : FixtureConfiguration<Color>
{
    public override void Configure()
    {
        Property(x => x.Value)
            .Length(6).Numerical().IsValid()
            .Valid("000000")
            .Valid("FFFFFF")
            .Invalid("g00000");
    }
}