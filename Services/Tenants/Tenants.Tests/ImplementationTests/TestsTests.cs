using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using FluentAssertions;
using NUnit.Framework;

namespace Zeta.Inpark.Tenants.Tests.ImplementationTests;

[TestFixture]
[Category(Categories.Implementation)]
public class TestsTests
{
    private static readonly Assembly Assembly = typeof(TestsTests).Assembly;
    
    public static IEnumerable<Type> GetTestFixturesTests()
    {
        return Assembly
            .GetExportedTypes()
            .Where(t => t.GetCustomAttribute<TestFixtureAttribute>() is not null 
                        || t.FullName?.EndsWith("Tests") is true);
    }

    [TestCaseSource(nameof(GetTestFixturesTests))]
    public void Test_ShouldHaveA_Category(Type @class)
    {
        // Arrange
        var hasCategoryAttribute = @class.GetCustomAttributes<CategoryAttribute>().Any();

        // Assert
        hasCategoryAttribute.Should().BeTrue();
    }
    
    public static IEnumerable<Type> GetTests()
    {
        return Assembly
            .GetExportedTypes()
            .Where(t => t.FullName?.EndsWith("Tests") is true);
    }
    
    [TestCaseSource(nameof(GetTests))]
    public void Test_ShouldHaveA_TestFixture(Type @class)
    {
        // Arrange
        var hasTestFixture = @class.GetCustomAttributes<TestFixtureAttribute>().Any();

        // Assert
        hasTestFixture.Should().BeTrue();
    }
}