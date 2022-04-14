using DomainFixture;
using Zoo.Inpark.Entities;

namespace Zoo.Inpark.Tests.DomainFixture.Configurations.Entities;

public class OpeningHourConfiguration : FixtureConfiguration<OpeningHour>
{
    public override void Configure()
    {
        Property(x => x.Name)
            .Length(1, 255).IsValid()
            .Empty().IsInvalid();
    }
}