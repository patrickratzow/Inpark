using DomainFixture;
using Zoo.Payments.Entities;

namespace Zoo.Payments.Tests.DomainFixture.Configurations.Entities;

public class CustomerConfiguration : FixtureConfiguration<Customer>
{
    public override void Configure()
    {
        Property(x => x.Name)
            .Length(1, 4096).IsValid()
            .Empty().IsInvalid();
    }
}