namespace Zoo.Inpark.Common;

public interface IJob<T> where T : IRequest<OneOf<Unit>>
{
    public Task Execute();
}