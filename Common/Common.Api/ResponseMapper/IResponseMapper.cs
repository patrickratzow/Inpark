using Microsoft.AspNetCore.Mvc;

namespace Zoo.Common.Api;

public interface IResponseMapper
{
    public ResponseMappingBuilder<T0> Map<T0>(OneOf<T0> oneOf) => new(this, oneOf);
    public ResponseMappingBuilder<T0, T1> Map<T0, T1>(OneOf<T0, T1> oneOf) => new(this, oneOf);
    public ResponseMappingBuilder<T0, T1, T2> Map<T0, T1, T2>(OneOf<T0, T1, T2> oneOf) => new(this, oneOf);

    public IActionResult Map<T0, T1, T2, T3>(OneOf<T0, T1, T2, T3> oneOf,
        Func<T0, IActionResult>? t0 = null, Func<T1, IActionResult>? t1 = null, Func<T2, IActionResult>? t2 = null,
        Func<T3, IActionResult>? t3 = null)
    {
        return oneOf.Match(
            t0 ?? MapResponse,
            t1 ?? MapResponse,
            t2 ?? MapResponse,
            t3 ?? MapResponse
        );
    }

    public IActionResult Map<T0, T1, T2, T3, T4>(OneOf<T0, T1, T2, T3, T4> oneOf,
        Func<T0, IActionResult>? t0 = null, Func<T1, IActionResult>? t1 = null, Func<T2, IActionResult>? t2 = null,
        Func<T3, IActionResult>? t3 = null, Func<T4, IActionResult>? t4 = null)
    {
        return oneOf.Match(
            t0 ?? MapResponse,
            t1 ?? MapResponse,
            t2 ?? MapResponse,
            t3 ?? MapResponse,
            t4 ?? MapResponse
        );
    }

    public IActionResult Map<T0, T1, T2, T3, T4, T5>(OneOf<T0, T1, T2, T3, T4, T5> oneOf,
        Func<T0, IActionResult>? t0 = null, Func<T1, IActionResult>? t1 = null, Func<T2, IActionResult>? t2 = null,
        Func<T3, IActionResult>? t3 = null, Func<T4, IActionResult>? t4 = null, Func<T5, IActionResult>? t5 = null)
    {
        return oneOf.Match(
            t0 ?? MapResponse,
            t1 ?? MapResponse,
            t2 ?? MapResponse,
            t3 ?? MapResponse,
            t4 ?? MapResponse,
            t5 ?? MapResponse
        );
    }

    public IActionResult Map<T0, T1, T2, T3, T4, T5, T6>(
        OneOf<T0, T1, T2, T3, T4, T5, T6> oneOf, Func<T0, IActionResult>? t0 = null,
        Func<T1, IActionResult>? t1 = null, Func<T2, IActionResult>? t2 = null, Func<T3, IActionResult>? t3 = null,
        Func<T4, IActionResult>? t4 = null, Func<T5, IActionResult>? t5 = null, Func<T6, IActionResult>? t6 = null)
    {
        return oneOf.Match(
            t0 ?? MapResponse,
            t1 ?? MapResponse,
            t2 ?? MapResponse,
            t3 ?? MapResponse,
            t4 ?? MapResponse,
            t5 ?? MapResponse,
            t6 ?? MapResponse
        );
    }

    public IActionResult Map<T0, T1, T2, T3, T4, T5, T6, T7>(
        OneOf<T0, T1, T2, T3, T4, T5, T6, T7> oneOf, Func<T0, IActionResult>? t0 = null,
        Func<T1, IActionResult>? t1 = null, Func<T2, IActionResult>? t2 = null, Func<T3, IActionResult>? t3 = null,
        Func<T4, IActionResult>? t4 = null, Func<T5, IActionResult>? t5 = null, Func<T6, IActionResult>? t6 = null,
        Func<T7, IActionResult>? t7 = null)
    {
        return oneOf.Match(
            t0 ?? MapResponse,
            t1 ?? MapResponse,
            t2 ?? MapResponse,
            t3 ?? MapResponse,
            t4 ?? MapResponse,
            t5 ?? MapResponse,
            t6 ?? MapResponse,
            t7 ?? MapResponse
        );
    }

    public ResponseMappingBuilder<T0, T1, T2, T3, T4, T5, T6, T7, T8> Map<T0, T1, T2, T3, T4, T5, T6, T7, T8>(
        OneOf<T0, T1, T2, T3, T4, T5, T6, T7, T8> oneOf)
        => new(this, oneOf);

    internal IActionResult MapResponse<TResponse>(TResponse response);
}