using System;
using DomainFixture;
using Zoo.Inpark.Common;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Tests.DomainFixture;

[TestFixture]
[Category(Categories.Unit)]
public class ValueObjectTests
{
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(AnimalName), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void AnimalNameTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(ImagePair), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void ImagePairTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(TimeRange), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void TimeRangeTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(SpeakTime), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void SpeakTimeTests(IEntityTester tester) => tester.Run();
}