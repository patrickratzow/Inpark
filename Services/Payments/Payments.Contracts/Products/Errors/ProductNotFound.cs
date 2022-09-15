using Zeta.Common;

namespace Zoo.Payments.Contracts;

public record ProductNotFound(Guid Id) : INotFoundError
{
    public string ErrorMessage => $"No product with the Id {Id} was found";
}