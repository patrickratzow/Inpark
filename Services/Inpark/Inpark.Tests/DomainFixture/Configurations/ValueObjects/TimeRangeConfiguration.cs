using System;
using DomainFixture;
using Zeta.Inpark.ValueObjects;

namespace Zoo.Inpark.Tests.DomainFixture.Configurations.ValueObjects;

public class TimeRangeConfiguration : FixtureConfiguration<TimeRange>
{
    public override void Configure()
    {
        Property(x => x.Start)
            .Valid(DateTime.Now.AddDays(-1));

        Property(x => x.End)
            .Valid(DateTime.Now.AddDays(1));
    }
}