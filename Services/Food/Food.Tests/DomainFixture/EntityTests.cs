using DomainFixture;
using Zeta.Inpark.Food.Common;
using Zeta.Inpark.Food.Entities;

namespace Zeta.Inpark.Food.Tests.DomainFixture;

[TestFixture]
[Category(Categories.Unit)]
public class EntityTests
{
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(Menu), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void MenuTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(MenuCategory), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void MenuCategoryTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(MenuItem), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void MenuItemTests(IEntityTester tester) => tester.Run();

    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(Merchant), new[] { typeof(Entity), typeof(ValueObject) }, new Type[] { } }
    )]
    public void MerchantTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(Shop), new[] { typeof(Entity), typeof(ValueObject) }, new Type[] { } }
    )]
    public void ShopTests(IEntityTester tester) => tester.Run();
}