using System.Collections.Generic;
using DomainFixture;
using Zeta.Inpark.ValueObjects;

namespace Zeta.Inpark.Tests.DomainFixture.Configurations.ValueObjects;

public class AnimalAreaConfiguration : FixtureConfiguration<AnimalArea>
{
    public override void Configure()
    {
        Property(x => x.Color)
            .Length(6).IsValid();

        Property(x => x.Points)
            .Valid(new List<Point>()
        {
            Point.From(0, 0)
        });
    }
}