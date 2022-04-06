using Zoo.Common.Api.SourceGenerator.Attributes.OpenApi;
using Zoo.Payments.Entities;

namespace Zoo.Payments.Features.Products;

public record CreateProductCommand(Guid Id, string Name) : IRequest<OneOf<Unit>>;

public class CreateProductCommandHandler : IRequestHandler<CreateProductCommand, OneOf<Unit>>
{
    private readonly PaymentsDbContext _context;

    public CreateProductCommandHandler(PaymentsDbContext context)
    {
        _context = context;
    }

    public async Task<OneOf<Unit>> Handle(CreateProductCommand request, CancellationToken cancellationToken)
    {
        var product = Product.Create(request.Id, request.Name);

        _context.Add(product);

        await _context.SaveChangesAsync(cancellationToken);

        return Unit.Value;
    }
}

public class CreateProductCommandValidator : AbstractValidator<CreateProductCommand>
{
    public CreateProductCommandValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty().MaximumLength(4096);
    }
}

public record CreateProductRequest(string Name);

[ApiController]
public partial class CreateProductController : ZooController
{
    private readonly IMediator _mediator;

    public CreateProductController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost("products")]
    [MethodGroup(Groups.Products)]
    [SuccessResponse(StatusCodes.Status201Created)]
    public async partial Task<ActionResult> CreateProduct([FromBody] CreateProductRequest request, 
        CancellationToken cancellationToken)
    {
        var productId = Guid.NewGuid();
        var command = new CreateProductCommand(productId, request.Name);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result)
            .When<Unit>(_ => 
                CreatedAtAction<GetProductByIdController>(x => x.GetProductById(productId, CancellationToken.None))
            );
    }
}
