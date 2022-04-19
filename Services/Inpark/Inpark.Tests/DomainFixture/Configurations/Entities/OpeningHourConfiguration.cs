using DomainFixture;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Enums;

namespace Zoo.Inpark.Tests.DomainFixture.Configurations.Entities;

public class OpeningHourConfiguration : FixtureConfiguration<OpeningHour>
{
    public override void Configure()
    {
        Property(x => x.Name)
            .Length(1, 255).IsValid()
            .Empty().IsInvalid();

        Property(x => x.Days)
            .Valid(
                WeekDay.None, 
                WeekDay.Monday, 
                WeekDay.Tuesday, 
                WeekDay.Wednesday, 
                WeekDay.Thursday,
                WeekDay.Friday, 
                WeekDay.Saturday, 
                WeekDay.Sunday
            );
    }
}