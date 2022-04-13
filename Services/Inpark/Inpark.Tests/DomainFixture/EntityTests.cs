using System;
using DomainFixture;
using Zoo.Inpark.Common;
using Zoo.Inpark.Entities;

namespace Zoo.Inpark.Tests.DomainFixture;

[TestFixture]
[Category(Categories.Unit)]
public class EntityTests
{
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(Animal), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void AnimalTests(IEntityTester tester) => tester.Run();
}