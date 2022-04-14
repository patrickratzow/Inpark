#nullable enable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using DomainFixture;
using FluentValidation;
using Zoo.Payments.Common;
using Zoo.Payments.Tests.DomainFixture;

namespace Zoo.Payments.Tests.ImplementationTests;

/*
 * The purpose of these tests are to ensure implementations of certain things.
 * It does not check if any implementation is "correct", merely that there is a implementation
 */
[TestFixture]
[Category(Categories.Implementation)]
public class DomainTests
{
    private static readonly Assembly Assembly = typeof(Entity).Assembly;

    private static bool IsDerivedOfGenericType(Type type, Type genericType)
    {
        if (type.IsGenericType && type.GetGenericTypeDefinition() == genericType)
        {
            return true;
        }

        return type.BaseType is not null && IsDerivedOfGenericType(type.BaseType, genericType);
    }

    private static IEnumerable<Type> GetAllEntities()
    {
        return Assembly
            .GetExportedTypes()
            .Where(t => t.IsSubclassOf(typeof(Entity)));
    }

    [TestCaseSource(nameof(GetAllEntities))]
    public void Entity_ShouldHaveA_Validator(Type request)
    {
        // Arrange
        var validators = Assembly
            .GetExportedTypes()
            .Where(t => IsDerivedOfGenericType(t, typeof(AbstractValidator<>)))
            .Where(t => t.GetInterfaces().Any(i =>
                IsDerivedOfGenericType(i, typeof(IValidator<>))
                && i.GenericTypeArguments.First().FullName == request.FullName
            ))
            .ToList();

        // Assert
        validators.Should().HaveCountGreaterOrEqualTo(1);
    }

    private static IEnumerable<Type> GetAllValueObjects()
    {
        return Assembly
            .GetExportedTypes()
            .Where(t => t.IsSubclassOf(typeof(ValueObject)));
    }

    [TestCaseSource(nameof(GetAllValueObjects))]
    public void ValueObject_ShouldHaveA_Validator(Type request)
    {
        // Arrange
        var validators = Assembly
            .GetExportedTypes()
            .Where(t => IsDerivedOfGenericType(t, typeof(AbstractValidator<>)))
            .Where(t => t.GetInterfaces().Any(i =>
                IsDerivedOfGenericType(i, typeof(IValidator<>))
                && i.GenericTypeArguments.First().FullName == request.FullName
            ))
            .ToList();

        // Assert
        validators.Should().HaveCountGreaterOrEqualTo(1);
    }

    private static IEnumerable<(IValidator validator, string propertyName)>
        GetEachPropertyWithItsRespectiveValidatorForEveryEntity()
    {
        var entities = GetAllEntities();

        foreach (var entity in entities)
        {
            var validators = Assembly
                .GetExportedTypes()
                .Where(t => IsDerivedOfGenericType(t, typeof(AbstractValidator<>)))
                .Where(t => t.GetInterfaces().Any(i =>
                    IsDerivedOfGenericType(i, typeof(IValidator<>))
                    && i.GenericTypeArguments.First().FullName == entity.FullName
                ))
                .Select(x => Activator.CreateInstance(x, true))
                .Cast<IValidator>()
                .ToList();
            var propertyNames = entity.GetProperties(BindingFlags.Instance | BindingFlags.Public
                                                                           | BindingFlags.NonPublic |
                                                                           BindingFlags.DeclaredOnly |
                                                                           BindingFlags.SetProperty
                                                                           | BindingFlags.GetProperty)
                .Where(p => p.CanRead && p.CanWrite)
                .Select(p => p.Name)
                .ToList();

            foreach (var validator in validators)
            {
                foreach (var propertyName in propertyNames)
                {
                    yield return (validator, propertyName);
                }
            }
        }
    }

    [TestCaseSource(
        nameof(GetEachPropertyWithItsRespectiveValidatorForEveryEntity))]
    public void EntityValidator_ShouldHaveARule_ForEveryProperty(
        (IValidator validator, string propertyName) tuple)
    {
        // Arrange
        var (validator, propertyName) = tuple;
        var rules = validator.GetType()
            .GetProperty("Rules", BindingFlags.Instance | BindingFlags.NonPublic)
            !.GetValue(validator, null) as IEnumerable<IValidationRule>;

        // Act
        var hasProperty = rules!.Any(r => r.PropertyName == propertyName);

        // Assert
        hasProperty.Should().BeTrue();
    }

    private static IEnumerable<(IValidator validator, string propertyName)>
        GetEachPropertyWithItsRespectiveValidatorForEveryValueObject()
    {
        var valueObjects = GetAllValueObjects();

        foreach (var valueObject in valueObjects)
        {
            var validators = Assembly
                .GetExportedTypes()
                .Where(t => IsDerivedOfGenericType(t, typeof(AbstractValidator<>)))
                .Where(t => t.GetInterfaces().Any(i =>
                    IsDerivedOfGenericType(i, typeof(IValidator<>))
                    && i.GenericTypeArguments.First().FullName == valueObject.FullName
                ))
                .Select(x => Activator.CreateInstance(x, true))
                .Cast<IValidator>()
                .ToList();
            var propertyNames = valueObject.GetProperties(BindingFlags.Instance | BindingFlags.Public
                    | BindingFlags.NonPublic | BindingFlags.DeclaredOnly | BindingFlags.SetProperty
                    | BindingFlags.GetProperty)
                .Where(p => p.CanRead && p.CanWrite)
                .Select(p => p.Name)
                .ToList();

            foreach (var validator in validators)
            {
                foreach (var propertyName in propertyNames)
                {
                    yield return (validator, propertyName);
                }
            }
        }
    }

    [TestCaseSource(
        nameof(GetEachPropertyWithItsRespectiveValidatorForEveryValueObject))]
    public void ValueObjectValidator_ShouldHaveARule_ForEveryProperty(
        (IValidator validator, string propertyName) tuple)
    {
        // Arrange
        var (validator, propertyName) = tuple;
        var rules = validator.GetType()
            .GetProperty("Rules", BindingFlags.Instance | BindingFlags.NonPublic)
            !.GetValue(validator, null) as IEnumerable<IValidationRule>;

        // Act
        var hasProperty = rules!.Any(r => r.PropertyName == propertyName);

        // Assert
        hasProperty.Should().BeTrue();
    }

    private static IEnumerable<(Type Type, PropertyInfo Property)> GetEachPropertyForAllEntities()
    {
        var entities = GetAllEntities();

        foreach (var entity in entities)
        {
            var properties = entity.GetProperties(
                    BindingFlags.Instance | BindingFlags.Public | BindingFlags.SetProperty |
                    BindingFlags.GetProperty | BindingFlags.NonPublic)
                .Where(p => p.CanWrite && p.CanRead);

            foreach (var property in properties)
            {
                yield return (entity, property);
            }
        }
    }

    [TestCaseSource(nameof(GetEachPropertyForAllEntities))]
    public void Entity_PropertiesOnlyHave_PrivateSetters((Type Type, PropertyInfo Property) tuple)
    {
        var (_, property) = tuple;

        property.Should().NotBeNull()
            .And.BeReadable()
            .And.BeWritable()
            .And.Subject.SetMethod.Should().NotBeNull()
            .And.Subject.IsPublic.Should().BeFalse();
    }

    private static IEnumerable<(Type Type, PropertyInfo Property)> GetEachPropertyForAllValueObjects()
    {
        var valueObjects = GetAllValueObjects();

        foreach (var valueObject in valueObjects)
        {
            var properties = valueObject.GetProperties(
                    BindingFlags.Instance | BindingFlags.Public | BindingFlags.SetProperty |
                    BindingFlags.GetProperty | BindingFlags.NonPublic)
                .Where(p => p.CanWrite && p.CanRead);

            foreach (var property in properties)
            {
                yield return (valueObject, property);
            }
        }
    }

    [TestCaseSource(nameof(GetEachPropertyForAllValueObjects))]
    public void ValueObject_PropertiesOnlyHave_PrivateSetters((Type Type, PropertyInfo Property) tuple)
    {
        var (_, property) = tuple;

        property.Should().NotBeNull()
            .And.BeReadable()
            .And.BeWritable()
            .And.Subject.SetMethod.Should().NotBeNull()
            .And.Subject.IsPublic.Should().BeFalse();
    }

    [TestCaseSource(nameof(GetAllEntities))]
    public void Entity_Has_FixtureConfiguration(Type entity)
    {
        // Arrange
        var configurations = typeof(DomainTests)
            .Assembly
            .GetExportedTypes()
            .Where(t => IsDerivedOfGenericType(t, typeof(FixtureConfiguration<>)))
            .Where(t => t.BaseType!.GenericTypeArguments.First().FullName == entity.FullName)
            .ToList();

        // Assert
        configurations.Should().HaveCountGreaterOrEqualTo(1);
    }

    [TestCaseSource(nameof(GetAllValueObjects))]
    public void ValueObject_Has_FixtureConfiguration(Type entity)
    {
        // Arrange
        var configurations = typeof(DomainTests)
            .Assembly
            .GetExportedTypes()
            .Where(t => IsDerivedOfGenericType(t, typeof(FixtureConfiguration<>)))
            .Where(t => t.BaseType!.GenericTypeArguments.First().FullName == entity.FullName)
            .ToList();

        // Assert
        configurations.Should().HaveCountGreaterOrEqualTo(1);
    }

    [TestCaseSource(nameof(GetAllEntities))]
    public void Entity_Has_FixtureTests(Type entity)
    {
        // Arrange
        var testClass = typeof(EntityTests);
        var hasGeneratedFixtureTests = testClass.GetMethods(BindingFlags.Instance | BindingFlags.Public)
            .Any(m => m.Name == $"{entity.Name}Tests");

        // Assert
        hasGeneratedFixtureTests.Should().BeTrue();
    }

    [TestCaseSource(nameof(GetAllValueObjects))]
    public void ValueObject_Has_FixtureTests(Type entity)
    {
        // Arrange
        var testClass = typeof(ValueObjectTests);
        var hasGeneratedFixtureTests = testClass.GetMethods(BindingFlags.Instance | BindingFlags.Public)
            .Any(m => m.Name == $"{entity.Name}Tests");

        // Assert
        hasGeneratedFixtureTests.Should().BeTrue();
    }
}