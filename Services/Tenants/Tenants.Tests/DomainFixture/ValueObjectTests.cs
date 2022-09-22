using System;
using DomainFixture;
using NUnit.Framework;
using Zeta.Inpark.Tenants.Common;
using Zeta.Inpark.Tenants.ValueObjects;

namespace Zeta.Inpark.Tenants.Tests.DomainFixture;

[TestFixture]
[Category(Categories.Unit)]
public class ValueObjectTests
{
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(GpsLocation), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void GpsLocationTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(Address), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void AddressTests(IEntityTester tester) => tester.Run();
}