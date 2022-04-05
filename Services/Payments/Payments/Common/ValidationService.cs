using System.Reflection;
using System.Runtime.Loader;

namespace Zoo.Payments.Common;

public static class ValidationService
{
    private static List<IValidator>? _validators;

    private static List<IValidator> Validators
        => _validators ??= Assembly.GetExecutingAssembly()
            .GetExportedTypes()
            .Where(t => t.IsAssignableTo(typeof(IValidator)))
            .Select(t => Activator.CreateInstance(t) as IValidator)
            .Where(t => t is not null)
            .ToList()!;

    public static void Validate(object instance, params Type[] bases)
    {
        var type = instance.GetType();
        ValidateBaseClasses(instance, type, bases);
        Validate(instance, type);
    }

    private static void ValidateBaseClasses(object instance, Type? instanceType, params Type[] bases)
    {
        if (instanceType is null) return;
        if (bases.Any(b => b != instanceType))
            ValidateBaseClasses(instance, instanceType.BaseType, bases);

        Validate(instance, instanceType);
    }

    private static void Validate(object instance, Type type)
    {
        var validator = FindValidators(type);
        var context = new ValidationContext<object>(instance);
        var errors = validator
            .Select(x => x.Validate(context))
            .SelectMany(x => x.Errors)
            .Where(x => x is not null)
            .ToList();

        if (errors.Any()) throw new ValidationException(errors);
    }

    private static IEnumerable<IValidator> FindValidators(Type type)
    {
        return Validators
            .Where(x =>
            {
                var interfaces = x.GetType().GetInterfaces();
                var genericTypeArguments = interfaces.Select(i => i.GenericTypeArguments);

                return genericTypeArguments
                    .Any(genericType => genericType.Any(generic => generic == type));
            });
    }
}