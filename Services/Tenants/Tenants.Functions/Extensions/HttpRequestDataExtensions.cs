using System.Reflection;
using System.Text.Json;
using FluentValidation;
using Microsoft.Azure.Functions.Worker.Http;

namespace Zeta.Inpark.Tenants.Functions.Extensions;

public static class HttpRequestDataExtensions
{
    private const int MaxLength = 30_000_000;

    public static Guid GetUserId(this HttpRequestData req) => Guid.NewGuid();
    
    public static async Task<T> FromJsonBody<T>(this HttpRequestData req)
    {
        if (req.Body.Length > MaxLength) throw new Exception("The body is bigger than it is allowed to be");
        
        using var body = new StreamContent(req.Body);
        var content = await body.ReadAsStringAsync();

        var obj = JsonSerializer.Deserialize<T>(content, new JsonSerializerOptions
        {
            PropertyNameCaseInsensitive = true
        });
        if (obj is null) throw new Exception("Returned NULL value from JSON deserializing");

        var validationContext = new ValidationContext<T>(obj);
        var validators = FindValidators(obj);
        var errors = validators
            .Select(x => x.Validate(validationContext))
            .SelectMany(x => x.Errors)
            .Where(x => x is not null)
            .ToList();

        if (errors.Any())
        {
            throw new ValidationException(errors);
        }
        
        return obj;
    }

    private static IEnumerable<IValidator<T>> FindValidators<T>(T obj)
    {
        var validators = Assembly.GetExecutingAssembly()
            .GetExportedTypes()
            .Where(t => IsDerivedOfGenericType(t, typeof(AbstractValidator<>)))
            .Where(t => t.GetInterfaces().Any(i =>
                IsDerivedOfGenericType(i, typeof(IValidator<>))
            ))
            .Select(Activator.CreateInstance)
            .Cast<IValidator<T>>();

        return validators;
    }
    
    private static bool IsDerivedOfGenericType(Type type, Type genericType)
    {
        if (type.IsGenericType && type.GetGenericTypeDefinition() == genericType)
        {
            return true;
        }

        return type.BaseType is not null && IsDerivedOfGenericType(type.BaseType, genericType);
    }
}