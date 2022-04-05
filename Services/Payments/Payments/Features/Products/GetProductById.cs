using Zoo.Payments.Contracts;

namespace Zoo.Payments.Features.Products;

public record GetProductByIdQuery(Guid Id) : IRequest<OneOf<Product, ProductNotFound>>;

public class GetProductByIdQueryHandler : IRequestHandler<GetProductByIdQuery, OneOf<Product, ProductNotFound>>
{
    private readonly PaymentsDbContext _context;

    public GetProductByIdQueryHandler(PaymentsDbContext context)
    {
        _context = context;
    }

    public async Task<OneOf<Product, ProductNotFound>> Handle(GetProductByIdQuery request, 
        CancellationToken cancellationToken)
    {
        var product = await _context.Products.FindByKey(request.Id, cancellationToken);
        if (product is null) return new ProductNotFound(request.Id);

        return new Product(product.Id, product.Name);
    }
}

public class GetProductByIdQueryValidator : AbstractValidator<GetProductByIdQuery>
{
    public GetProductByIdQueryValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
    }
}

[ApiController]
[MethodGroup(Groups.Products)]
public partial class GetProductByIdController : ZooController
{
    private readonly IMediator _mediator;

    public GetProductByIdController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpGet("products/{productId:guid}")]
    public async partial Task<ActionResult> GetProductById([FromRoute] Guid productId, 
        CancellationToken cancellationToken)
    {
        var command = new GetProductByIdQuery(productId);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}