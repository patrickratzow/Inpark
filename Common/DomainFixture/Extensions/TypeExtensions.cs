using System.Reflection;

namespace DomainFixture;

internal static class TypeExtensions
{
    internal static bool IsAssignableTo(this Type from, Type to)
        => to.IsAssignableFrom(from);

    internal static bool IsDerivedOfGenericType(this Type type, Type genericType)
    {
        if (type.IsGenericType && type.GetGenericTypeDefinition() == genericType) return true;

        return type.BaseType is not null && IsDerivedOfGenericType(type.BaseType, genericType);
    }

    internal static void SetRecursiveValue(this PropertyInfo propertyInfo,
        string name,
        object instance,
        object[] values,
        Type? invokeType = null)
    {
        invokeType ??= instance.GetType();

        while (true)
        {
            try
            {
                invokeType!.InvokeMember(
                    name,
                    BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.SetProperty |
                    BindingFlags.Instance,
                    null,
                    instance,
                    values
                );

                break;
            }
            catch (MissingMethodException)
            {
                var baseType = invokeType!.BaseType;
                if (baseType == typeof(object))
                    throw new InvalidOperationException($"Unable to set {name} property");

                invokeType = baseType;
            }
        }
    }
}