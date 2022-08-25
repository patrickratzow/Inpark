using DomainFixture;
using Zeta.Inpark.Entities;

namespace Zoo.Inpark.Tests.DomainFixture.Configurations.Entities;

public class SpeakConfiguration : FixtureConfiguration<Speak>
{
    public override void Configure()
    {
        Property(x => x.Title)
            .Length(1).IsValid()
            .Empty().IsInvalid();
    }
}