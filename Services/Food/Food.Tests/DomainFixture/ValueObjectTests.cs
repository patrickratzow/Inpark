using System.Drawing;
using DomainFixture;
using Zeta.Inpark.Food.Common;
using Zeta.Inpark.Food.ValueObjects;

namespace Zeta.Inpark.Food.Tests.DomainFixture;

[TestFixture]
[Category(Categories.Unit)]
public class ValueObjectTests
{
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(CvrNumber), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void CvrNumberTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(MerchantName), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void MerchantNameTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(Price), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void PriceTests(IEntityTester tester) => tester.Run();
}