using System;
using DomainFixture;
using Zoo.Payments.Contracts;
using Zoo.Payments.Contracts.Common;
using Zoo.Payments.Contracts.Customers;

namespace Zoo.Payments.Tests.DomainFixture;

[TestFixture]
[Category(Categories.Unit)]
public class ContractTests
{
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(CreateProductRequest), new[] { typeof(Request) }, new Type[] {}}
    )]
    public void CreateProductRequestTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(CreateCustomerRequest), new[] { typeof(Request) }, new Type[] {}}
    )]
    public void CreateCustomerRequestTests(IEntityTester tester) => tester.Run();
}