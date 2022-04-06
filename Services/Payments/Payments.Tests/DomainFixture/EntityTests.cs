using System;
using DomainFixture;
using Zoo.Payments.Common;
using Zoo.Payments.Entities;

namespace Zoo.Payments.Tests.DomainFixture;

[TestFixture]
[Category(Categories.Unit)]
public class EntityTests
{
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(Product), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void ProductTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(Customer), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void CustomerTests(IEntityTester tester) => tester.Run();
}