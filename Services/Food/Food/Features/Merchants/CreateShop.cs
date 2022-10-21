using Microsoft.EntityFrameworkCore;
using Zeta.Inpark.Food.Entities;
using Zeta.Inpark.Food.Extensions;

namespace Zeta.Inpark.Food.Features.Merchants;

public class CreateShop
{
    public record Command(
        Guid Id,
        Guid MerchantId,
        string Name,
        string Description
    ) : IRequest<OneOf<Unit>>;

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Id).NotEmpty();
            RuleFor(x => x.MerchantId).NotEmpty();
            RuleFor(x => x.Name).NotEmpty();
            RuleFor(x => x.Description).NotEmpty();
        }
    }

    public class Handler : IRequestHandler<Command, OneOf<Unit>>
    {
        private readonly FoodDbContext _context;

        public Handler(FoodDbContext context)
        {
            _context = context;
        }

        public async Task<OneOf<Unit>> Handle(Command request, CancellationToken cancellationToken)
        {
            var merchant = await _context.Merchants.FindOrFailAsync(request.MerchantId, cancellationToken);
            var shop = Shop.Create(
                request.Id, 
                request.Name, 
                request.Description
            );
            _context.Entry(shop).State = EntityState.Added;

            merchant.AddShop(shop);

            await _context.SaveChangesAsync(cancellationToken);
            
            return Unit.Value;
        }
    }

    public record Request(
        Guid Id,
        string Name,
        string CvrNumber
    );
}