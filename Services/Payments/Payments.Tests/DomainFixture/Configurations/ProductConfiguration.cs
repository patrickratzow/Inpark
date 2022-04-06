using DomainFixture;
using Zoo.Payments.Entities;

namespace Zoo.Payments.Tests.DomainFixture.Configurations;

public class ProductConfiguration : FixtureConfiguration<Product>
{
    public override void Configure()
    {
        Property(x => x.Name)
            .Length(1, 4096).IsValid()
            .Empty().IsInvalid();
    }
}