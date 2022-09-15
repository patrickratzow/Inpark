using DomainFixture;
using Zeta.Inpark.Enums;
using Zeta.Inpark.ValueObjects;

namespace Zeta.Inpark.Tests.DomainFixture.Configurations.ValueObjects;

public class SpeakTimeConfiguration : FixtureConfiguration<SpeakTime>
{
    public override void Configure()
    {
        Property(x => x.Title)
            .Length(1).IsValid()
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