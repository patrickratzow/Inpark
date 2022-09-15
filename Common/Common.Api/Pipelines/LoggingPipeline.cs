using System.Collections;
using System.Reflection;
using System.Text;
using MediatR;
using Microsoft.Extensions.Logging;

namespace Zeta.Common.Api;

public class LoggingPipeline<TRequest, TResponse> : IPipelineBehavior<TRequest, TResponse>
    where TRequest : IRequest<TResponse>
{
    private readonly ILogger<TRequest> _logger;

    public LoggingPipeline(ILogger<TRequest> logger)
    {
        _logger = logger;
    }

    public async Task<TResponse> Handle(TRequest request, CancellationToken cancellationToken, 
        RequestHandlerDelegate<TResponse> next)
    {
        var requestName = request.GetType().Name;
        var scope = _logger.BeginScope("Request {Name}", requestName);

        try
        {
            var response = await next();

            if (response is null)
            {
                _logger.LogError("Returned a NULL response");
            }
            else
            {
                // We know that we get something back wrapped in IOneOf, but for sanity's sake lets check
                if (response is not IOneOf oneOf)
                {
                    _logger.LogError(
                        "Returned something that is not OneOf. The returned value was {Response}", response
                    );
                }
                else
                {
                    var value = oneOf.Value;
                    var name = value.GetType().Name;
                    var contents = value.ToString();
                    
                    _logger.LogInformation("Returned {Name} with the contents {Contents}", name, contents);
                }
            }


            return response;
        }
        catch (Exception ex)
        {
            _logger.LogError("An Exception was thrown. Exception: {Exception}", ex);
            
            throw;
        }
        finally
        {
            scope.Dispose();
        }
    }
}

public class LoggingStringBuilder
{
    private readonly StringBuilder _builder = new();
    private int _indentation = 0;
    private string Indentation => new('\t', _indentation);

    public void Add(object target)
    {
        if (target is string str)
        {
            _builder.Append(str);
            
            return;
        }
        
        var type = target.GetType();
        var name = type.Name;

        AppendLine(name);
        AppendLine("{");
        _indentation++;
        if (target is IEnumerable enumerable)
        {
            foreach (var item in enumerable)
            {
                Add(item);
            }
        }
        else
        {
            foreach (var property in type.GetProperties(BindingFlags.Public | BindingFlags.Instance))
            {
                var value = property.GetValue(target);
                if (value is null)
                {
                    AppendLine($"{property.Name} = null");
                }
                else
                {
                    Add(value);
                }
            }
        }
      
        _indentation--;
        AppendLine("}");
    }

    private void AddProperty(PropertyInfo property, object target)
    {
        var name = property.Name;
        Append($"{Indentation}{name}: ");
        if (target.GetType().IsAssignableTo(typeof(IEnumerable)) && !target.GetType().IsPrimitive)
        {
            NewLine();
            AppendLine("[");
            _indentation++;
            
            var enumerator = ((IEnumerable)target).GetEnumerator();
            while (enumerator.MoveNext())
            {
                var current = enumerator.Current;
                if (current is null) continue;
                
                //Add(current);
            }

            _indentation--;
            Append($"{Indentation}]");

            return;
        }
        
        
        var value = property.GetValue(target);
        if (value is null) return;

        Add(value);
    }

    private void AppendLine(string value)
    {
        _builder.AppendLine($"{Indentation}{value}");
    }
    
    private void Append(string value)
    {
        _builder.Append($"{value}");
    }

    private void NewLine()
    {
        Append(Environment.NewLine);
    }

    public override string ToString() => _builder.ToString();
}
