using System;
using DomainFixture;
using Zeta.Inpark.Entities;

namespace Zeta.Inpark.Tests.DomainFixture.Configurations.Entities;

public class HourRangeConfiguration : FixtureConfiguration<HourRange>
{
    public override void Configure()
    {
        Property(x => x.Start)
            .Valid(DateTime.Now);

        Property(x => x.End)
            .Valid(DateTime.Now.AddHours(1));
        
        Property(x => x.Color)
            .Length(6).Numerical().IsValid()
            .Valid("000000")
            .Valid("FFFFFF")
            .Invalid("g00000");
    }
}