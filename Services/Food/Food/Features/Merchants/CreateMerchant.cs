using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Zeta.Common.Api;
using Zeta.Inpark.Food.Entities;
using Zeta.Inpark.Food.ValueObjects;

namespace Zeta.Inpark.Food.Features.Merchants;

public class CreateMerchant
{
    public record Command(
        Guid Id,
        string Name,
        string CvrNumber
    ) : IRequest<OneOf<Unit, CvrNumberAlreadyExists>>;

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Id).NotEmpty();
            RuleFor(x => x.Name).NotEmpty();
            RuleFor(x => x.CvrNumber).NotEmpty();
        }
    }

    public class Handler : IRequestHandler<Command, OneOf<Unit, CvrNumberAlreadyExists>>
    {
        private readonly FoodDbContext _context;

        public Handler(FoodDbContext context)
        {
            _context = context;
        }

        public async Task<OneOf<Unit, CvrNumberAlreadyExists>> Handle(Command request, CancellationToken cancellationToken)
        {
            var name = MerchantName.From(request.Name);
            var cvrNumber = CvrNumber.From(request.CvrNumber);

            var existingMerchant = await _context.Merchants
                .FirstOrDefaultAsync(x => x.CvrNumber.Value == cvrNumber.Value, cancellationToken);
            if (existingMerchant is not null) return new CvrNumberAlreadyExists(cvrNumber.Value);
            
            var merchant = Merchant.Create(request.Id, name, cvrNumber);

            _context.Merchants.Add(merchant);
            await _context.SaveChangesAsync(cancellationToken);

            return Unit.Value;
        }
    }

    public record CvrNumberAlreadyExists(string CvrNumber) : IAlreadyExistsError
    {
        public string ErrorMessage => $"CVR Number {CvrNumber} is already in use";
    }
    
    public record Request(
        string Name,
        string CvrNumber
    );
}

[ApiController]
[MethodGroup(Groups.Merchants)]
public partial class CreateMerchantController : ZooController
{
    private readonly IMediator _mediator;

    public CreateMerchantController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Creates a merchant.
    /// </summary>
    [HttpPost("merchants")]
    public async partial Task<ActionResult> CreateMerchant([FromBody] CreateMerchant.Request request, 
        CancellationToken cancellationToken)
    {
        var id = Guid.NewGuid();
        var command = new CreateMerchant.Command(id, request.Name, request.CvrNumber);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}