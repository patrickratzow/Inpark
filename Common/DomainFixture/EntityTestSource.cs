using System.Collections;
using System.Linq.Expressions;
using System.Reflection;

namespace DomainFixture;

public static class EntityTestSource
{
    internal static dynamic? CreateValidEntity(Type entityType)
    {
        /*
        if (!FluentTests.Bases.Any(b => entityType.IsSubclassOf(b)
                                        || FluentTests.IsAssignableToGenericType(entityType, b))) return null;
        */
        var instance = CreateInstance(entityType);
        if (instance is null) return null;

        MakeEntityValid(instance, instance.GetType());

        return instance;
    }
    
    private static dynamic? CreateInstance(Type entityType)
    {
        if (entityType.IsInterface && entityType.IsGenericType)
        {
            var firstGeneric = entityType.GetGenericArguments().First();
            var readonlyCollection = typeof(IReadOnlyCollection<>).MakeGenericType(firstGeneric);
            var readonlyList = typeof(IReadOnlyList<>).MakeGenericType(firstGeneric);
            if (entityType == readonlyCollection || entityType == readonlyList)
            {
                var type = typeof(List<>).MakeGenericType(firstGeneric);
                
                return Activator.CreateInstance(type, true);
            }
            var readonlySet = typeof(IReadOnlySet<>).MakeGenericType(firstGeneric);
            if (entityType == readonlySet)
            {
                var set = typeof(HashSet<>).MakeGenericType(firstGeneric);
                
                return Activator.CreateInstance(set, true);
            }
            var secondGeneric = entityType.GetGenericArguments().Skip(1).First();
            var readonlyDictionary = typeof(IReadOnlyDictionary<,>).MakeGenericType(firstGeneric, secondGeneric);
            if (entityType == readonlyDictionary)
            {
                var dictionary = typeof(Dictionary<,>).MakeGenericType(firstGeneric, secondGeneric);
                
                return Activator.CreateInstance(dictionary, true);
            }
        }
        
        var instance = Activator.CreateInstance(entityType, true);
        if (instance is null) return null;
        
        return instance;
    }

    public static IEnumerable<object[]> Test(Type entityType, Type[] baseTypes, Type[]? assemblies = null)
    {
        foreach (var baseType in baseTypes)
        {
            if (FluentTests.Bases.Contains(baseType)) continue;

            FluentTests.Bases.Add(baseType);
        }

        if (!FluentTests.TryGetEntityData(entityType, out var entityDataDictionary)) yield break;
        var instance = Activator.CreateInstance(entityType, true);
        if (instance is null) yield break;

        var properties = instance.GetType()
            .GetProperties(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic)
            .Where(x => x.CanWrite && x.CanRead);

        var entityTesters = new List<EntityTester>();
        foreach (var property in properties)
        {
            var key = property.Name;
            if (!entityDataDictionary.TryGetValue(key, out var tuple)) continue;
            var (valids, invalids) = tuple;

            MakeEntityValid(instance, instance.GetType());

            foreach (var valid in valids)
            {
                var value = (dynamic)valid;
                var compiled = value.Compile();
                var valueName = GetValueName(value);
                var tester = new EntityTester(instance, key, compiled, true, valueName);
                entityTesters.Add(tester);

                yield return new object[]
                {
                    tester
                };
            }
            foreach (var invalid in invalids)
            {
                var value = (dynamic)invalid;
                var compiled = value.Compile();
                var valueName = GetValueName(value);
                var tester = new EntityTester(instance, key, compiled, false, valueName);
                entityTesters.Add(tester);

                yield return new object[]
                {
                    tester
                };
            }
        }

        var longestProperty = entityTesters.Max(x => x.PropertyName.Length);
        var longestOutcome = entityTesters.Max(x => x.OutcomeName.Length);

        foreach (var entityTester in entityTesters)
        {
            entityTester.PropertyLength = longestProperty;
            entityTester.OutcomeLength = longestOutcome;
        }
    }

    private static string GetValueName(dynamic value)
    {
        var name = value.Body.ToString();
        if (value.Body is not MemberExpression body) return name;
        var propertyBuilder = body.Expression;
        if (propertyBuilder is not ConstantExpression constantExpression) return name;
        var fieldType = constantExpression.Value?.GetType();
        if (fieldType is null) return name;
        var field = fieldType.GetField("value", BindingFlags.Instance | BindingFlags.Public);
        if (field is null) return name;

        return field.GetValue(constantExpression.Value)?.ToString() ?? name;
    }

    private static void MakeEntityValid(object entity, Type? type)
    {
        if (type is null) return;
        if (type == typeof(object) ||
            FluentTests.Bases.Any(x => x == type || FluentTests.IsAssignableToGenericType(type, x))
            || type == typeof(ValueType)) return;

        MakeEntityValid(entity, type.BaseType);
        if (!FluentTests.TryGetEntityData(type, out var entityDataDictionary))
            throw new InvalidOperationException($"{type.Name} has no {nameof(IClassConfiguration)}");

        var properties = type
            .GetProperties(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic |
                           BindingFlags.SetProperty)
            .Where(x => x.CanWrite)
            .Where(x => !x.Name.StartsWith("_"));

        foreach (var property in properties)
        {
            dynamic value;
            var key = property.Name;
            if (!entityDataDictionary.TryGetValue(key, out var tuple))
            {
                var entityType = property.PropertyType;
                if (property.PropertyType.IsAssignableTo(typeof(IList)))
                {
                    entityType = property.PropertyType.GenericTypeArguments.First();
                }

                if (entityType.IsAbstract && !entityType.IsInterface)
                {
                    entityType = entityType.Assembly
                        .GetTypes()
                        .First(t => t.IsSubclassOf(entityType));
                }


                if (property.PropertyType.IsAssignableTo(typeof(IList)))
                {
                    var constructedType = typeof(List<>).MakeGenericType(entityType);
                    var collection = Activator.CreateInstance(constructedType) as dynamic;
                    var props = entity.GetType()
                        .GetProperties(BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic
                                       | BindingFlags.SetProperty)
                        .Where(x => x.CanWrite)
                        .ToList();
                    // Pure fucking GARBAGE
                    if (props.All(x => x.PropertyType != entityType &&
                                       !x.PropertyType.IsAssignableTo(typeof(IList))
                                       && x.PropertyType.GenericTypeArguments.FirstOrDefault() != entityType))
                    {
                        value = CreateValidEntity(entityType) ??
                                throw new InvalidOperationException(
                                    $"Unable to find tests for property named {key}");
                        (collection as IList)!.Add(value);
                    }

                    value = collection!;
                }
                else
                {
                    value = CreateValidEntity(entityType) ??
                            throw new InvalidOperationException($"Unable to find tests for property named {key}");
                }
            }
            else
            {
                var operation = tuple.Valid.FirstOrDefault();
                if (operation is null)
                    throw new InvalidOperationException(
                        $"Unable to find any valid values for {entity.GetType().Name}.{key}. " +
                        "Cannot create a valid instance without knowing what is valid");

                var compiled = ((dynamic)operation).Compile();
                value = compiled.Invoke((dynamic)entity);
            }

            property.SetRecursiveValue(key, entity, new[]
            {
                value
            });
        }
    }
}

public interface IEntityTester
{
    void Run();
}

public class EntityTester : IEntityTester
{
    private readonly dynamic _compiledFunc;
    private readonly object _entity;
    private readonly bool _shouldSucceed;
    private readonly string _valueName;

    public EntityTester(object entity, string propertyName, dynamic compiledFunc, bool shouldSucceed,
        string valueName)
    {
        _entity = entity;
        PropertyName = propertyName;
        _compiledFunc = compiledFunc;
        _shouldSucceed = shouldSucceed;
        _valueName = valueName;
    }

    public string PropertyName { get; }
    public string OutcomeName => _shouldSucceed ? "Valid" : "Invalid";

    internal int PropertyLength { get; set; }
    internal int OutcomeLength { get; set; }

    public void Run()
    {
        var type = _entity.GetType();
        var property = type.GetProperty(PropertyName, BindingFlags.Instance | BindingFlags.Public);
        if (property is null)
            throw new MissingMemberException($"Expected {type.Name} to have a {PropertyName} property");
        if (!property.CanWrite) return;
        var value = property.GetValue(_entity);

        try
        {
            var newValue = _compiledFunc((dynamic)_entity);
            property.SetRecursiveValue(PropertyName, _entity, new[]
            {
                newValue
            });

            if (type.Assembly.IsDynamic)
            {
                
            }
            var validateMethod = type.GetMethod("Validate",
                BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            validateMethod?.Invoke(_entity, Array.Empty<object>());

            if (!_shouldSucceed)
                throw new Exception("Excepted to fail :(");
        }
        catch (TargetInvocationException)
        {
            if (_shouldSucceed)
                throw;
        }
        finally
        {
            property.SetRecursiveValue(PropertyName, _entity, new[]
            {
                value
            }!);
        }
    }

    public override string ToString() => $"{PropertyName.PadLeft(PropertyLength)}" +
                                         $" - {OutcomeName.PadLeft(OutcomeLength)}" +
                                         $" - \"{_valueName}\"";
}