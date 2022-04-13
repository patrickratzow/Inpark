#nullable enable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using DomainFixture;
using FluentValidation;
using Zoo.Inpark.Contracts;

namespace Zoo.Inpark.Tests.ImplementationTests;

/*
 * The purpose of these tests are to ensure implementations of certain things.
 * It does not check if any implementation is "correct", merely that there is a implementation
 */
[TestFixture]
[Category(Categories.Unit)]
[Category(Categories.Implementation)]
public class ContractTests
{
    private static readonly Assembly Assembly = typeof(ContentDto).Assembly;

    private static bool IsDerivedOfGenericType(Type type, Type genericType)
    {
        if (type.IsGenericType && type.GetGenericTypeDefinition() == genericType)
        {
            return true;
        }

        return type.BaseType is not null && IsDerivedOfGenericType(type.BaseType, genericType);
    }


    private static IEnumerable<Type> GetAllDataTransferObjects()
    {
        return Assembly
            .GetExportedTypes()
            .Where(x => !x.IsEnum)
            .Where(t => t.Name.EndsWith("Request") || t.Name.EndsWith("Dto"))
            .Where(t => t.Name != "Request");
    }
    
    private static IEnumerable<Type> GetAllRequests()
    {
        return Assembly
            .GetExportedTypes()
            .Where(x => !x.IsEnum)
            .Where(t => t.Name.EndsWith("Request"))
            .Where(t => t.Name != "Request");
    }


    [TestCaseSource(nameof(GetAllDataTransferObjects))]
    public void Object_IsA_DataTransferObjectOrRequest(Type request)
    {
        // Arrange
        var isRecord = ((TypeInfo)request).DeclaredProperties
            .FirstOrDefault(x => x.Name == "EqualityContract")
            ?.GetMethod
            ?.GetCustomAttribute(typeof(CompilerGeneratedAttribute)) is not null;

        // Assert
        var name = request?.FullName ?? "cannot load name";
        isRecord.Should().BeTrue($"dto type '{ name }' is not record.");
    }

    private static IEnumerable<(IValidator validator, string propertyName)>
        GetEachPropertyWithItsRespectiveValidatorFromEveryRequestThatHasAtLeastOneProperty()
    {
        var dtos = GetAllDataTransferObjects();

        foreach (var request in dtos)
        {
            var validators = Assembly
                .GetExportedTypes()
                .Where(t => IsDerivedOfGenericType(t, typeof(AbstractValidator<>)))
                .Where(t => t.GetInterfaces().Any(i =>
                    IsDerivedOfGenericType(i, typeof(IValidator<>))
                    && i.GenericTypeArguments.First().FullName == request.FullName
                ))
                .Select(Activator.CreateInstance)
                .Cast<IValidator>()
                .ToList();
            var propertyNames = request.GetProperties(BindingFlags.Instance | BindingFlags.Public)
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
        nameof(GetEachPropertyWithItsRespectiveValidatorFromEveryRequestThatHasAtLeastOneProperty))]
    public void Validator_HasARule_ForEveryProperty(
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
        var validatorName = validator.GetType().FullName;
        hasProperty.Should().BeTrue(
            $"Validator '{ validatorName }' does not have a rule for property { propertyName }");
    }


    [TestCaseSource(nameof(GetAllRequests))]
    public void Request_HasARule_ForEveryProperty(Type request)
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

    [TestCaseSource(nameof(GetAllRequests))]
    public void Request_Has_FixtureConfiguration(Type entity)
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

    [TestCaseSource(nameof(GetAllRequests))]
    public void Request_Has_FixtureTests(Type entity)
    {
        // Arrange
        var testClass = typeof(DomainFixture.ContractTests);
        var hasGeneratedFixtureTests = testClass.GetMethods(BindingFlags.Instance | BindingFlags.Public)
            .Any(m => m.Name == $"{entity.Name}Tests");

        // Assert
        hasGeneratedFixtureTests.Should().BeTrue();
    }
}