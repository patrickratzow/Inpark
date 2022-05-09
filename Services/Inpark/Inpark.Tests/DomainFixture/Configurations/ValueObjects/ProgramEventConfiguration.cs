using DomainFixture;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Tests.DomainFixture.Configurations.ValueObjects
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
