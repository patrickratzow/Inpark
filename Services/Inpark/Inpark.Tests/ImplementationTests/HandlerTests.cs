using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using FluentValidation;
using MediatR;

namespace Zoo.Inpark.Tests.ImplementationTests;

/// <summary>
/// The purpose of these tests are to ensure implementations of certain things.
/// It does not check if any implementation is "correct", merely that there is a implementation 
/// </summary>
[TestFixture]
[Category(Categories.Implementation)]
public class HandlerTests
{
    private static readonly Assembly Assembly = typeof(DependencyInjection).Assembly;

    private static IEnumerable<Type> GetAllHandlers()
    {
        return Assembly
            .GetExportedTypes()
            .Where(t => t.GetInterfaces().Any(i => i.Name == "IRequestHandler`2"))
            .ToList();
    }

    private static IEnumerable<MethodInfo> GetAllHandlerHandleMethods()
    {
        var handlers = GetAllHandlers();

        foreach (var handler in handlers)
        {
            var methods = handler
                .GetMethods(BindingFlags.Instance | BindingFlags.Public)
                .Where(m => m.Name == "Handle");
            foreach (var method in methods)
            {
                yield return method;
            }
        }
    }

    private static IEnumerable<Type> GetAllErrorModels()
    {
        var returnModels = new HashSet<Type>();

        foreach (var method in GetAllHandlerHandleMethods())
        {
            var returnTask = method.ReturnType;
            var returnType = returnTask.GetGenericArguments().First();
            if (returnType.Namespace != "OneOf") continue;

            var models = returnType.GenericTypeArguments;
            var errorModels = models.Skip(1);
            foreach (var errorModel in errorModels)
            {
                returnModels.Add(errorModel);
            }
        }

        foreach (var model in returnModels)
        {
            yield return model;
        }
    }

    [TestCaseSource(nameof(GetAllErrorModels))]
    public void Request_EveryOneOfGenericButTheFirstImplements_IError(Type errorModel)
    {
        // Act
        var implements = errorModel.IsAssignableTo(typeof(IError));

        // Assert
        implements.Should().BeTrue();
    }

    private static bool IsDerivedOfGenericType(Type type, Type genericType)
    {
        if (type.IsGenericType && type.GetGenericTypeDefinition() == genericType)
        {
            return true;
        }

        return type.BaseType is not null && IsDerivedOfGenericType(type.BaseType, genericType);
    }

    private static IEnumerable<Type> GetAllRequestsWithAtLeastOneProperty()
    {
        return GetAllRequests()
            .Where(t => t.GetProperties().Any());
    }

    [TestCaseSource(nameof(GetAllRequestsWithAtLeastOneProperty))]
    public void Request_EveryRequestWithAtLeastOneProperty_HasAValidator(Type request)
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

    private static IEnumerable<Type> GetAllRequests()
    {
        return Assembly
            .GetExportedTypes()
            .Where(t => t.GetInterfaces().Any(i => i.Name == "IRequest`1")
                        && !t.IsAssignableTo(typeof(INotification)));
    }

    [TestCaseSource(nameof(GetAllRequests))]
    public void Request_IsA_Record(Type request)
    {
        // Arrange
        var isRecord = ((TypeInfo)request).DeclaredProperties
            .FirstOrDefault(x => x.Name == "EqualityContract")
            ?.GetMethod
            ?.GetCustomAttribute(typeof(CompilerGeneratedAttribute)) is not null;

        // Assert
        isRecord.Should().BeTrue();
    }

    [TestCaseSource(nameof(GetAllRequests))]
    public void Request_Returns_OneOf(Type request)
    {
        // Arrange
        var requestInterface = request.GetInterfaces().First();
        var returnType = requestInterface.GenericTypeArguments.First();

        // Assert
        returnType.Name.Should().StartWith("OneOf`");
    }

    private static IEnumerable<(IValidator validator, string propertyName)>
        GetEachPropertyWithItsRespectiveValidatorFromEveryRequestThatHasAtLeastOneProperty()
    {
        var requests = GetAllRequestsWithAtLeastOneProperty();

        foreach (var request in requests)
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
                .Where(p => p.PropertyType != typeof(bool))
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
    public void Validator_EveryPropertyHasA_ValidationRule(
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
}