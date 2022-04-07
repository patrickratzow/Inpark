using DomainFixture;
using Zoo.Payments.Contracts;
using Zoo.Payments.Contracts.Customers;

namespace Zoo.Payments.Tests.DomainFixture.Configurations.Contracts;

public class CreateCustomerRequestConfiguration : FixtureConfiguration<CreateCustomerRequest>
{
    public override void Configure()
    {
        Property(x => x.Name)
            .Length(1, 4096).IsValid()
            .Empty().IsInvalid();
        
        Property(x => x.Email)
            .Length(1, 4096).IsValid()
            .Empty().IsInvalid();
    }
}

public class CreateProductRequestConfiguration : FixtureConfiguration<CreateProductRequest>
{
    public override void Configure()
    {
        Property(x => x.Name)
            .Length(1, 4096).IsValid()
            .Empty().IsInvalid();
    }
}