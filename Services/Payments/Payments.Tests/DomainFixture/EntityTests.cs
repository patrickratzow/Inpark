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
        new object[] { typeof(Product), new [] { typeof(Entity) }, new Type[] {}}
    )]
    public void ProductTests(IEntityTester tester) => tester.Run();
}