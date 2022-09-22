using System.Linq.Expressions;
using System.Reflection;
using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.Extensions.DependencyInjection;

namespace Zeta.Common.Api;

public class ZooController : ControllerBase
{
    private IResponseMapper Mapper => HttpContext.RequestServices.GetRequiredService<IResponseMapper>();

    protected static CreatedAtActionResult CreatedAtAction<TController>(
        Expression<Action<TController>> action,
        [ActionResultObjectValue] object? objectValue = null
    )
    {
        var controllerName = typeof(TController).Name.Replace("Controller", "");
        if (action.Body is not MethodCallExpression methodCallExpression) 
            throw new ArgumentException("Expression must be a method call expression", nameof(action));

        var (routeValues, actionName) = GetRouteParameters(action, methodCallExpression);

        return new(
            actionName,
            controllerName,
            routeValues,
            objectValue
        );
    }

    private static readonly Regex RouteParameterRegex = new(@"{(?<name>\w+)(?<type>\:\w+)?\}", RegexOptions.Compiled);
    private static (Dictionary<string, object> RouteValues, string ActionName) GetRouteParameters<TController>(
        Expression<Action<TController>> action, MethodCallExpression methodCallExpression)
    {
        var actionName = methodCallExpression.Method.Name;
        var controllerRouteNames = GetRouteParameterNames(typeof(TController));
        var actionMethod = typeof(TController).GetMethod(actionName);
        var actionRouteNames = GetRouteParameterNames(actionMethod!);
        var routeValues = new Dictionary<string, object>();
        var routeNames = controllerRouteNames.Concat(actionRouteNames).ToList();

        for (var i = 0; i < methodCallExpression.Arguments.Count && routeValues.Count < routeNames.Count; i++)
        {
            var argument = methodCallExpression.Arguments[i]; 
            var lambda = Expression.Lambda(argument);
            var value = lambda.Compile().DynamicInvoke();
            // If it's some kind of cancellationToken we couldn't care less :)
            if (value is CancellationToken) continue;
            
            var key = routeNames[i];
            routeValues[key] = value!;
        }

        return (routeValues, actionName);
    }

    private static IEnumerable<string> GetRouteParameterNames(IRouteTemplateProvider routeProvider)
    {
        var routeMatches = RouteParameterRegex.Matches(routeProvider.Template!);
        var routeParameters = new List<string>();
        foreach (Match match in routeMatches)
        {
            if (!match.Groups.TryGetValue("name", out var name))
                throw new ArgumentException("Route parameter name not found", nameof(routeProvider));

            routeParameters.Add(name.Value);
        }
        
        return routeParameters;
    }

    private static IEnumerable<string> GetRouteParameterNames(MemberInfo type)
    {
        var routeProvider = type.GetCustomAttributes()
            .Where(t => t.GetType().IsAssignableTo(typeof(IRouteTemplateProvider)))
            .Cast<IRouteTemplateProvider>()
            .FirstOrDefault(x => x.Template is not null);
        if (routeProvider is null) return Array.Empty<string>();

        return GetRouteParameterNames(routeProvider);
    }
    
    protected ResponseMappingBuilder<T0> Map<T0>(OneOf<T0> oneOf)
    {
        return Mapper.Map(oneOf);
    }

    protected ResponseMappingBuilder<T0, T1> Map<T0, T1>(OneOf<T0, T1> oneOf)
    {
        return Mapper.Map(oneOf);
    }

    protected ResponseMappingBuilder<T0, T1, T2> Map<T0, T1, T2>(OneOf<T0, T1, T2> oneOf)
    {
        return Mapper.Map(oneOf);
    }

    protected IActionResult Map<T0, T1, T2, T3>(OneOf<T0, T1, T2, T3> oneOf, Func<T0, IActionResult>? t0 = null,
        Func<T1, IActionResult>? t1 = null, Func<T2, IActionResult>? t2 = null, Func<T3, IActionResult>? t3 = null)
    {
        return Mapper.Map(oneOf, t0, t1, t2, t3);
    }

    protected IActionResult Map<T0, T1, T2, T3, T4>(OneOf<T0, T1, T2, T3, T4> oneOf,
        Func<T0, IActionResult>? t0 = null, Func<T1, IActionResult>? t1 = null, Func<T2, IActionResult>? t2 = null,
        Func<T3, IActionResult>? t3 = null, Func<T4, IActionResult>? t4 = null)
    {
        return Mapper.Map(oneOf, t0, t1, t2, t3, t4);
    }

    protected IActionResult Map<T0, T1, T2, T3, T4, T5>(OneOf<T0, T1, T2, T3, T4, T5> oneOf,
        Func<T0, IActionResult>? t0 = null, Func<T1, IActionResult>? t1 = null, Func<T2, IActionResult>? t2 = null,
        Func<T3, IActionResult>? t3 = null, Func<T4, IActionResult>? t4 = null, Func<T5, IActionResult>? t5 = null)
    {
        return Mapper.Map(oneOf, t0, t1, t2, t3, t4, t5);
    }

    protected IActionResult Map<T0, T1, T2, T3, T4, T5, T6>(OneOf<T0, T1, T2, T3, T4, T5, T6> oneOf,
        Func<T0, IActionResult>? t0 = null, Func<T1, IActionResult>? t1 = null, Func<T2, IActionResult>? t2 = null,
        Func<T3, IActionResult>? t3 = null, Func<T4, IActionResult>? t4 = null, Func<T5, IActionResult>? t5 = null,
        Func<T6, IActionResult>? t6 = null)
    {
        return Mapper.Map(oneOf, t0, t1, t2, t3, t4, t5, t6);
    }

    protected IActionResult Map<T0, T1, T2, T3, T4, T5, T6, T7>(OneOf<T0, T1, T2, T3, T4, T5, T6, T7> oneOf,
        Func<T0, IActionResult>? t0 = null, Func<T1, IActionResult>? t1 = null, Func<T2, IActionResult>? t2 = null,
        Func<T3, IActionResult>? t3 = null, Func<T4, IActionResult>? t4 = null, Func<T5, IActionResult>? t5 = null,
        Func<T6, IActionResult>? t6 = null, Func<T7, IActionResult>? t7 = null)
    {
        return Mapper.Map(oneOf, t0, t1, t2, t3, t4, t5, t6, t7);
    }
}