using System;
using DomainFixture;
using NUnit.Framework;
using Zeta.Inpark.Tenants.Common;
using Zeta.Inpark.Tenants.Entities;

namespace Zeta.Inpark.Tenants.Tests.DomainFixture;

[TestFixture]
[Category(Categories.Unit)]
public class EntityTests
{
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(Feature), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void FeatureTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(Service), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void ServiceTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(Tenant), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void TenantTests(IEntityTester tester) => tester.Run();
}