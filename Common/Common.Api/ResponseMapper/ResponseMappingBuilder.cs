using Microsoft.AspNetCore.Mvc;

namespace Zeta.Common.Api;

public class ResponseMappingBuilder<T0>
{
    private readonly IResponseMapper _mapper;
    private readonly OneOf<T0> _result;
    private readonly Dictionary<Type, IResponseMappingWhenOperation> _whenDictionary = new();

    public ResponseMappingBuilder(IResponseMapper mapper, OneOf<T0> result)
    {
        _mapper = mapper;
        _result = result;
    }

    public ResponseMappingBuilder<T0> When<TFunc0>(Func<T0, IActionResult> func)
        where TFunc0 : T0
    {
        var operation = new ResponseMappingWhenOperation<T0>(func);
        var type = typeof(TFunc0);
        _whenDictionary[type] = operation;

        return this;
    }

    public IActionResult Build()
    {
        var response = _result.Value;
        foreach (var (key, value) in _whenDictionary)
        {
            var type = response.GetType();
            if (type == key || type.IsSubclassOf(key))
                return value.Run(response);
        }

        return _mapper.MapResponse(_result.Value);
    }

    public static implicit operator ActionResult(ResponseMappingBuilder<T0> builder)
    {
        return (ActionResult)builder.Build();
    }
}

public class ResponseMappingBuilder<T0, T1>
{
    private readonly IResponseMapper _mapper;
    private readonly OneOf<T0, T1> _result;
    private readonly Dictionary<Type, IResponseMappingWhenOperation> _whenDictionary = new();

    public ResponseMappingBuilder(IResponseMapper mapper, OneOf<T0, T1> result)
    {
        _mapper = mapper;
        _result = result;
    }

    public ResponseMappingBuilder<T0, T1> When<TFunc0>(Func<T0, IActionResult> func)
        where TFunc0 : T0
    {
        var operation = new ResponseMappingWhenOperation<T0>(func);
        var type = typeof(TFunc0);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1> When<TFunc1>(Func<T1, IActionResult> func)
        where TFunc1 : T1
    {
        var operation = new ResponseMappingWhenOperation<T1>(func);
        var type = typeof(TFunc1);
        _whenDictionary[type] = operation;

        return this;
    }

    public IActionResult Build()
    {
        var response = _result.Value;
        foreach (var (key, value) in _whenDictionary)
        {
            var type = response.GetType();
            if (type == key || type.IsSubclassOf(key))
                return value.Run(response);
        }

        return _mapper.MapResponse(_result.Value);
    }

    public static implicit operator ActionResult(ResponseMappingBuilder<T0, T1> builder)
    {
        return (ActionResult)builder.Build();
    }
}

public class ResponseMappingBuilder<T0, T1, T2>
{
    private readonly IResponseMapper _mapper;
    private readonly OneOf<T0, T1, T2> _result;
    private readonly Dictionary<Type, IResponseMappingWhenOperation> _whenDictionary = new();

    public ResponseMappingBuilder(IResponseMapper mapper, OneOf<T0, T1, T2> result)
    {
        _mapper = mapper;
        _result = result;
    }

    public ResponseMappingBuilder<T0, T1, T2> When<TFunc0>(Func<T0, IActionResult> func)
        where TFunc0 : T0
    {
        var operation = new ResponseMappingWhenOperation<T0>(func);
        var type = typeof(TFunc0);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2> When<TFunc1>(Func<T1, IActionResult> func)
        where TFunc1 : T1
    {
        var operation = new ResponseMappingWhenOperation<T1>(func);
        var type = typeof(TFunc1);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2> When<TFunc2>(Func<T2, IActionResult> func)
        where TFunc2 : T2
    {
        var operation = new ResponseMappingWhenOperation<T2>(func);
        var type = typeof(TFunc2);
        _whenDictionary[type] = operation;

        return this;
    }

    public IActionResult Build()
    {
        var response = _result.Value;
        foreach (var (key, value) in _whenDictionary)
        {
            var type = response.GetType();
            if (type == key || type.IsSubclassOf(key))
                return value.Run(response);
        }

        return _mapper.MapResponse(_result.Value);
    }

    public static implicit operator ActionResult(ResponseMappingBuilder<T0, T1, T2> builder)
    {
        return (ActionResult)builder.Build();
    }
}

public class ResponseMappingBuilder<T0, T1, T2, T3>
{
    private readonly IResponseMapper _mapper;
    private readonly OneOf<T0, T1, T2, T3> _result;
    private readonly Dictionary<Type, IResponseMappingWhenOperation> _whenDictionary = new();

    public ResponseMappingBuilder(IResponseMapper mapper, OneOf<T0, T1, T2, T3> result)
    {
        _mapper = mapper;
        _result = result;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3> When<TFunc0>(Func<T0, IActionResult> func)
        where TFunc0 : T0
    {
        var operation = new ResponseMappingWhenOperation<T0>(func);
        var type = typeof(TFunc0);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3> When<TFunc1>(Func<T1, IActionResult> func)
        where TFunc1 : T1
    {
        var operation = new ResponseMappingWhenOperation<T1>(func);
        var type = typeof(TFunc1);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3> When<TFunc2>(Func<T2, IActionResult> func)
        where TFunc2 : T2
    {
        var operation = new ResponseMappingWhenOperation<T2>(func);
        var type = typeof(TFunc2);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3> When<TFunc3>(Func<T3, IActionResult> func)
        where TFunc3 : T3
    {
        var operation = new ResponseMappingWhenOperation<T3>(func);
        var type = typeof(TFunc3);
        _whenDictionary[type] = operation;

        return this;
    }

    public IActionResult Build()
    {
        var response = _result.Value;
        foreach (var (key, value) in _whenDictionary)
        {
            var type = response.GetType();
            if (type == key || type.IsSubclassOf(key))
                return value.Run(response);
        }

        return _mapper.MapResponse(_result.Value);
    }

    public static implicit operator ActionResult(ResponseMappingBuilder<T0, T1, T2, T3> builder)
    {
        return (ActionResult)builder.Build();
    }
}

public class ResponseMappingBuilder<T0, T1, T2, T3, T4>
{
    private readonly IResponseMapper _mapper;
    private readonly OneOf<T0, T1, T2, T3, T4> _result;
    private readonly Dictionary<Type, IResponseMappingWhenOperation> _whenDictionary = new();

    public ResponseMappingBuilder(IResponseMapper mapper, OneOf<T0, T1, T2, T3, T4> result)
    {
        _mapper = mapper;
        _result = result;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4> When<TFunc0>(Func<T0, IActionResult> func)
        where TFunc0 : T0
    {
        var operation = new ResponseMappingWhenOperation<T0>(func);
        var type = typeof(TFunc0);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4> When<TFunc1>(Func<T1, IActionResult> func)
        where TFunc1 : T1
    {
        var operation = new ResponseMappingWhenOperation<T1>(func);
        var type = typeof(TFunc1);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4> When<TFunc2>(Func<T2, IActionResult> func)
        where TFunc2 : T2
    {
        var operation = new ResponseMappingWhenOperation<T2>(func);
        var type = typeof(TFunc2);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4> When<TFunc3>(Func<T3, IActionResult> func)
        where TFunc3 : T3
    {
        var operation = new ResponseMappingWhenOperation<T3>(func);
        var type = typeof(TFunc3);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4> When<TFunc4>(Func<T4, IActionResult> func)
        where TFunc4 : T4
    {
        var operation = new ResponseMappingWhenOperation<T4>(func);
        var type = typeof(TFunc4);
        _whenDictionary[type] = operation;

        return this;
    }

    public IActionResult Build()
    {
        var response = _result.Value;
        foreach (var (key, value) in _whenDictionary)
        {
            var type = response.GetType();
            if (type == key || type.IsSubclassOf(key))
                return value.Run(response);
        }

        return _mapper.MapResponse(_result.Value);
    }

    public static implicit operator ActionResult(ResponseMappingBuilder<T0, T1, T2, T3, T4> builder)
    {
        return (ActionResult)builder.Build();
    }
}

public class ResponseMappingBuilder<T0, T1, T2, T3, T4, T5>
{
    private readonly IResponseMapper _mapper;
    private readonly OneOf<T0, T1, T2, T3, T4, T5> _result;
    private readonly Dictionary<Type, IResponseMappingWhenOperation> _whenDictionary = new();

    public ResponseMappingBuilder(IResponseMapper mapper, OneOf<T0, T1, T2, T3, T4, T5> result)
    {
        _mapper = mapper;
        _result = result;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5> When<TFunc0>(Func<T0, IActionResult> func)
        where TFunc0 : T0
    {
        var operation = new ResponseMappingWhenOperation<T0>(func);
        var type = typeof(TFunc0);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5> When<TFunc1>(Func<T1, IActionResult> func)
        where TFunc1 : T1
    {
        var operation = new ResponseMappingWhenOperation<T1>(func);
        var type = typeof(TFunc1);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5> When<TFunc2>(Func<T2, IActionResult> func)
        where TFunc2 : T2
    {
        var operation = new ResponseMappingWhenOperation<T2>(func);
        var type = typeof(TFunc2);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5> When<TFunc3>(Func<T3, IActionResult> func)
        where TFunc3 : T3
    {
        var operation = new ResponseMappingWhenOperation<T3>(func);
        var type = typeof(TFunc3);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5> When<TFunc4>(Func<T4, IActionResult> func)
        where TFunc4 : T4
    {
        var operation = new ResponseMappingWhenOperation<T4>(func);
        var type = typeof(TFunc4);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5> When<TFunc5>(Func<T5, IActionResult> func)
        where TFunc5 : T5
    {
        var operation = new ResponseMappingWhenOperation<T5>(func);
        var type = typeof(TFunc5);
        _whenDictionary[type] = operation;

        return this;
    }

    public IActionResult Build()
    {
        var response = _result.Value;
        foreach (var (key, value) in _whenDictionary)
        {
            var type = response.GetType();
            if (type == key || type.IsSubclassOf(key))
                return value.Run(response);
        }

        return _mapper.MapResponse(_result.Value);
    }

    public static implicit operator ActionResult(ResponseMappingBuilder<T0, T1, T2, T3, T4, T5> builder)
    {
        return (ActionResult)builder.Build();
    }
}

public class ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6>
{
    private readonly IResponseMapper _mapper;
    private readonly OneOf<T0, T1, T2, T3, T4, T5, T6> _result;
    private readonly Dictionary<Type, IResponseMappingWhenOperation> _whenDictionary = new();

    public ResponseMappingBuilder(IResponseMapper mapper, OneOf<T0, T1, T2, T3, T4, T5, T6> result)
    {
        _mapper = mapper;
        _result = result;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6> When<TFunc0>(Func<T0, IActionResult> func)
        where TFunc0 : T0
    {
        var operation = new ResponseMappingWhenOperation<T0>(func);
        var type = typeof(TFunc0);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6> When<TFunc1>(Func<T1, IActionResult> func)
        where TFunc1 : T1
    {
        var operation = new ResponseMappingWhenOperation<T1>(func);
        var type = typeof(TFunc1);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6> When<TFunc2>(Func<T2, IActionResult> func)
        where TFunc2 : T2
    {
        var operation = new ResponseMappingWhenOperation<T2>(func);
        var type = typeof(TFunc2);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6> When<TFunc3>(Func<T3, IActionResult> func)
        where TFunc3 : T3
    {
        var operation = new ResponseMappingWhenOperation<T3>(func);
        var type = typeof(TFunc3);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6> When<TFunc4>(Func<T4, IActionResult> func)
        where TFunc4 : T4
    {
        var operation = new ResponseMappingWhenOperation<T4>(func);
        var type = typeof(TFunc4);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6> When<TFunc5>(Func<T5, IActionResult> func)
        where TFunc5 : T5
    {
        var operation = new ResponseMappingWhenOperation<T5>(func);
        var type = typeof(TFunc5);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6> When<TFunc6>(Func<T6, IActionResult> func)
        where TFunc6 : T6
    {
        var operation = new ResponseMappingWhenOperation<T6>(func);
        var type = typeof(TFunc6);
        _whenDictionary[type] = operation;

        return this;
    }

    public IActionResult Build()
    {
        var response = _result.Value;
        foreach (var (key, value) in _whenDictionary)
        {
            var type = response.GetType();
            if (type == key || type.IsSubclassOf(key))
                return value.Run(response);
        }

        return _mapper.MapResponse(_result.Value);
    }

    public static implicit operator ActionResult(ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6> builder)
    {
        return (ActionResult)builder.Build();
    }
}

public class ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7>
{
    private readonly IResponseMapper _mapper;
    private readonly OneOf<T0, T1, T2, T3, T4, T5, T6, T7> _result;
    private readonly Dictionary<Type, IResponseMappingWhenOperation> _whenDictionary = new();

    public ResponseMappingBuilder(IResponseMapper mapper, OneOf<T0, T1, T2, T3, T4, T5, T6, T7> result)
    {
        _mapper = mapper;
        _result = result;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7> When<TFunc0>(Func<T0, IActionResult> func)
        where TFunc0 : T0
    {
        var operation = new ResponseMappingWhenOperation<T0>(func);
        var type = typeof(TFunc0);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7> When<TFunc1>(Func<T1, IActionResult> func)
        where TFunc1 : T1
    {
        var operation = new ResponseMappingWhenOperation<T1>(func);
        var type = typeof(TFunc1);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7> When<TFunc2>(Func<T2, IActionResult> func)
        where TFunc2 : T2
    {
        var operation = new ResponseMappingWhenOperation<T2>(func);
        var type = typeof(TFunc2);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7> When<TFunc3>(Func<T3, IActionResult> func)
        where TFunc3 : T3
    {
        var operation = new ResponseMappingWhenOperation<T3>(func);
        var type = typeof(TFunc3);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7> When<TFunc4>(Func<T4, IActionResult> func)
        where TFunc4 : T4
    {
        var operation = new ResponseMappingWhenOperation<T4>(func);
        var type = typeof(TFunc4);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7> When<TFunc5>(Func<T5, IActionResult> func)
        where TFunc5 : T5
    {
        var operation = new ResponseMappingWhenOperation<T5>(func);
        var type = typeof(TFunc5);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7> When<TFunc6>(Func<T6, IActionResult> func)
        where TFunc6 : T6
    {
        var operation = new ResponseMappingWhenOperation<T6>(func);
        var type = typeof(TFunc6);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7> When<TFunc7>(Func<T7, IActionResult> func)
        where TFunc7 : T7
    {
        var operation = new ResponseMappingWhenOperation<T7>(func);
        var type = typeof(TFunc7);
        _whenDictionary[type] = operation;

        return this;
    }

    public IActionResult Build()
    {
        var response = _result.Value;
        foreach (var (key, value) in _whenDictionary)
        {
            var type = response.GetType();
            if (type == key || type.IsSubclassOf(key))
                return value.Run(response);
        }

        return _mapper.MapResponse(_result.Value);
    }

    public static implicit operator ActionResult(ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7> builder)
    {
        return (ActionResult)builder.Build();
    }
}

public class ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7, T8>
{
    private readonly IResponseMapper _mapper;
    private readonly OneOf<T0, T1, T2, T3, T4, T5, T6, T7, T8> _result;
    private readonly Dictionary<Type, IResponseMappingWhenOperation> _whenDictionary = new();

    public ResponseMappingBuilder(IResponseMapper mapper, OneOf<T0, T1, T2, T3, T4, T5, T6, T7, T8> result)
    {
        _mapper = mapper;
        _result = result;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7, T8> When<TFunc0>(Func<T0, IActionResult> func)
        where TFunc0 : T0
    {
        var operation = new ResponseMappingWhenOperation<T0>(func);
        var type = typeof(TFunc0);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7, T8> When<TFunc1>(Func<T1, IActionResult> func)
        where TFunc1 : T1
    {
        var operation = new ResponseMappingWhenOperation<T1>(func);
        var type = typeof(TFunc1);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7, T8> When<TFunc2>(Func<T2, IActionResult> func)
        where TFunc2 : T2
    {
        var operation = new ResponseMappingWhenOperation<T2>(func);
        var type = typeof(TFunc2);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7, T8> When<TFunc3>(Func<T3, IActionResult> func)
        where TFunc3 : T3
    {
        var operation = new ResponseMappingWhenOperation<T3>(func);
        var type = typeof(TFunc3);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7, T8> When<TFunc4>(Func<T4, IActionResult> func)
        where TFunc4 : T4
    {
        var operation = new ResponseMappingWhenOperation<T4>(func);
        var type = typeof(TFunc4);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7, T8> When<TFunc5>(Func<T5, IActionResult> func)
        where TFunc5 : T5
    {
        var operation = new ResponseMappingWhenOperation<T5>(func);
        var type = typeof(TFunc5);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7, T8> When<TFunc6>(Func<T6, IActionResult> func)
        where TFunc6 : T6
    {
        var operation = new ResponseMappingWhenOperation<T6>(func);
        var type = typeof(TFunc6);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7, T8> When<TFunc7>(Func<T7, IActionResult> func)
        where TFunc7 : T7
    {
        var operation = new ResponseMappingWhenOperation<T7>(func);
        var type = typeof(TFunc7);
        _whenDictionary[type] = operation;

        return this;
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7, T8> When<TFunc8>(Func<T8, IActionResult> func)
        where TFunc8 : T8
    {
        var operation = new ResponseMappingWhenOperation<T8>(func);
        var type = typeof(TFunc8);
        _whenDictionary[type] = operation;

        return this;
    }

    public IActionResult Build()
    {
        var response = _result.Value;
        foreach (var (key, value) in _whenDictionary)
        {
            var type = response.GetType();
            if (type == key || type.IsSubclassOf(key))
                return value.Run(response);
        }

        return _mapper.MapResponse(_result.Value);
    }

    public static implicit operator ActionResult(
        ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7, T8> builder)
    {
        return (ActionResult)builder.Build();
    }
}