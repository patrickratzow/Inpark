using Zoo.Payments.Contracts.Customers;
using Zoo.Payments.Entities;
using Zoo.Payments.ValueObjects;

namespace Zoo.Payments.Features.Customers;

public record CreateCustomerCommand(Guid Id, string Name, string Email) : IRequest<OneOf<Unit>>;

public class CreateCustomerCommandHandler : IRequestHandler<CreateCustomerCommand, OneOf<Unit>>
{
    private readonly PaymentsDbContext _context;

    public CreateCustomerCommandHandler(PaymentsDbContext context)
    {
        _context = context;
    }

    public async Task<OneOf<Unit>> Handle(CreateCustomerCommand request, CancellationToken cancellationToken)
    {
        var email = EmailAddress.From(request.Email);
        var customer = Customer.Create(request.Id, request.Name, email);

        _context.Add(customer);

        await _context.SaveChangesAsync(cancellationToken);

        return Unit.Value;
    }
}

public class CreateCustomerCommandValidator : AbstractValidator<CreateCustomerCommand>
{
    public CreateCustomerCommandValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty().MaximumLength(4096);
        RuleFor(x => x.Email).NotEmpty().MaximumLength(4096);
    }
}

[ApiController]
[MethodGroup(Groups.Customers)]
public partial class CreateCustomerController : ZooController
{
    private readonly IMediator _mediator;

    public CreateCustomerController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost("customers")]
    public async partial Task<ActionResult> CreateCustomer([FromBody] CreateCustomerRequest request, 
        CancellationToken cancellationToken)
    {
        var id = Guid.NewGuid();
        var command = new CreateCustomerCommand(id, request.Name, request.Email);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}