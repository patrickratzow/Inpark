using System;
using DomainFixture;
using Zeta.Inpark.ValueObjects;

namespace Zeta.Inpark.Tests.DomainFixture.Configurations.ValueObjects
{
    public class ProgramEventConfiguration : FixtureConfiguration<ProgramEvent>
    {
        public override void Configure()
        {
            Property(x => x.StartTime)
                .Valid(DateTime.Now)
                .Invalid(default(DateTime));

            Property(x => x.EndTime)
                .Valid(DateTime.Now.AddMinutes(1));

            Property(x => x.Description)
                .Length(1).IsValid()
                .Empty().IsInvalid();
        }
    }
}
