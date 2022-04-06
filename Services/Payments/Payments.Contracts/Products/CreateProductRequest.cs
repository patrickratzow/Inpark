using FluentValidation;
using Zoo.Payments.Contracts.Common;

namespace Zoo.Payments.Contracts;

public record CreateProductRequest(string Name) : Request
{
    private CreateProductRequest() : this(string.Empty) {}
}

public class CreateProductRequestValidator : AbstractValidator<CreateProductRequest>
{
    public CreateProductRequestValidator()
    {
        RuleFor(x => x.Name).NotEmpty().MaximumLength(4096);
    }
}