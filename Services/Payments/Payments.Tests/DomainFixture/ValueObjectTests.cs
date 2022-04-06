using System;
using DomainFixture;
using Zoo.Payments.Common;
using Zoo.Payments.ValueObjects;

namespace Zoo.Payments.Tests.DomainFixture;

[TestFixture]
[Category(Categories.Unit)]
public class ValueObjectTests
{
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(EmailAddress), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void EmailAddressTests(IEntityTester tester) => tester.Run();
}