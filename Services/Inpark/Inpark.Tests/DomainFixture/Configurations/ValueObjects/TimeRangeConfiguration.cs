using System;
using DomainFixture;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Tests.DomainFixture.Configurations.ValueObjects;

public class TimeRangeConfiguration : FixtureConfiguration<TimeRange>
{
    public override void Configure()
    {
        Property(x => x.Start)
            .Valid(DateTimeOffset.Now.AddDays(-1));

        Property(x => x.End)
            .Valid(DateTimeOffset.Now.AddDays(1));
    }
}