using DomainFixture;
using Zeta.Inpark.Entities;

namespace Zoo.Inpark.Tests.DomainFixture.Configurations.Entities;

public class AnimalConfiguration : FixtureConfiguration<Animal>
{
    public override void Configure()
    {
        Property(x => x.Category)
            .Length(1).IsValid()
            .Empty().IsInvalid();
        
        Property(x => x.Content)
            .Empty().IsInvalid()
            .Valid("[]");
    }
}