using DomainFixture;
using Zeta.Inpark.ValueObjects;

namespace Zoo.Inpark.Tests.DomainFixture.Configurations.ValueObjects;

public class PointConfiguration : FixtureConfiguration<Point>
{
    public override void Configure()
    {
        Property(x => x.X)
            .GreaterThanOrEquals(0).IsValid()
            .LessThanOrEquals(100).IsValid();

        Property(x => x.Y)
            .GreaterThanOrEquals(0).IsValid()
            .LessThanOrEquals(100).IsValid();
    }
}