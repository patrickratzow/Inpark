using FluentValidation;
using Zoo.Payments.Contracts.Common;

namespace Zoo.Payments.Contracts.Customers;

public record CreateCustomerRequest(string Name, string Email) : Request
{
    private CreateCustomerRequest() : this(null!, null!) {}
};

public class CreateCustomerRequestValidator : AbstractValidator<CreateCustomerRequest>
{
    public CreateCustomerRequestValidator()
    {
        RuleFor(x => x.Name).NotEmpty().MaximumLength(4096);
        RuleFor(x => x.Email).NotEmpty().MaximumLength(4096);
    }
}