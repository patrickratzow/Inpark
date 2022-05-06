using DomainFixture;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zoo.Inpark.Entities;

namespace Zoo.Inpark.Tests.DomainFixture.Configurations.Entities
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
