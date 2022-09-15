using DomainFixture;
using Zeta.Inpark.Entities;

namespace Zeta.Inpark.Tests.DomainFixture.Configurations.Entities
{
    public class ParkEventConfiguration : FixtureConfiguration<ParkEvent>
    {
        public override void Configure()
        {
            Property(x => x.Title)
                .Length(1).IsValid()
                .Empty().IsInvalid();

            Property(x => x.Content)
                .Empty().IsInvalid()
                .Valid("[]");
        }
    }
}
