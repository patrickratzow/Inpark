using OneOf;
using OneOf.Types;

namespace Zoo.Common;

public class Result : OneOfBase<Success, Error>
{
    private Result(OneOf<Success, Error> input) : base(input) { }

    public static Result Success => new(OneOf<Success, Error>.FromT0(new()));
    public static Result Error => new(OneOf<Success, Error>.FromT1(new()));

    public bool IsSuccess() => IsT0;
    public bool IsError() => IsT1;

    public static implicit operator Result(Success success) => new(OneOf<Success, Error>.FromT0(success));
    public static implicit operator Result(Error genericError) => new(OneOf<Success, Error>.FromT1(genericError));
}

public class Result<TError> : OneOfBase<Success, Error<TError>>
{
    private Result(OneOf<Success, Error<TError>> input) : base(input) { }

    public static Result<TError> Success => new(OneOf<Success, Error<TError>>.FromT0(new()));

    public bool IsSuccess() => IsT0;
    public bool IsError() => IsT1;

    public bool IsError(
#if !NETSTANDARD2_0
        [NotNullWhen(true)]
#endif
        out TError? error)
    {
        error = IsT1
            ? AsT1.Value
            : default;

        return IsT1;
    }

    public static Result<TError> Error(TError error) => new(OneOf<Success, Error<TError>>.FromT1(new(error)));

    public static implicit operator Result<TError>(Success success) =>
        new(OneOf<Success, Error<TError>>.FromT0(success));

    public static implicit operator Result<TError>(Error<TError> error) =>
        new(OneOf<Success, Error<TError>>.FromT1(error));

    public static implicit operator Result<TError>(TError error) =>
        new(OneOf<Success, Error<TError>>.FromT1(new(error)));
}

public class Result<TSuccess, TError> : OneOfBase<Success<TSuccess>, Error<TError>>
{
    private Result(OneOf<Success<TSuccess>, Error<TError>> input) : base(input) { }

    public bool IsSuccess() => IsT0;

    public bool IsSuccess(
#if !NETSTANDARD2_0
    [NotNullWhen(true)]
#endif
        out TSuccess? success)
    {
        success = IsT0
            ? AsT0.Value
            : default;

        return IsT1;
    }

    public bool IsError() => IsT1;

    public bool IsError(
#if !NETSTANDARD2_0
    [NotNullWhen(true)]
#endif
        out TError? error)
    {
        error = IsT1
            ? AsT1.Value
            : default;

        return IsT1;
    }

    public static Result<TSuccess, TError> Success(TSuccess success)
        => new(OneOf<Success<TSuccess>, Error<TError>>.FromT0(new(success)));

    public static Result<TSuccess, TError> Error(TError error)
        => new(OneOf<Success<TSuccess>, Error<TError>>.FromT1(new(error)));

    public static implicit operator Result<TSuccess, TError>(Success<TSuccess> success)
        => new(OneOf<Success<TSuccess>, Error<TError>>.FromT0(success));

    public static implicit operator Result<TSuccess, TError>(TSuccess success)
        => new(OneOf<Success<TSuccess>, Error<TError>>.FromT0(new(success)));

    public static implicit operator Result<TSuccess, TError>(Error<TError> error)
        => new(OneOf<Success<TSuccess>, Error<TError>>.FromT1(error));

    public static implicit operator Result<TSuccess, TError>(TError error)
        => new(OneOf<Success<TSuccess>, Error<TError>>.FromT1(new(error)));
}