﻿using System;
using DomainFixture;
using Zeta.Inpark.Common;
using Zeta.Inpark.Entities;

namespace Zeta.Inpark.Tests.DomainFixture;

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
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(OpeningHour), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void OpeningHourTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(Speak), new [] { typeof(Entity), typeof(ValueObject) }, new Type[] {}}
    )]
    public void SpeakTests(IEntityTester tester) => tester.Run();

    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(ParkEvent), new[] { typeof(Entity), typeof(ValueObject) }, new Type[] { } }
    )]
    public void ParkEventTests(IEntityTester tester) => tester.Run();
    
    [TestCaseSource(
        typeof(EntityTestSource),
        nameof(EntityTestSource.Test),
        new object[] { typeof(HourRange), new[] { typeof(Entity), typeof(ValueObject) }, new Type[] { } }
    )]
    public void HourRangeTests(IEntityTester tester) => tester.Run();
}