using MediatR;
using Microsoft.EntityFrameworkCore;
using OneOf;
using Zeta.Inpark.Tenants.Contracts;

namespace Zeta.Inpark.Tenants.Features;

public record GetAllParksQuery : IRequest<OneOf<List<ParkDto>>>;

public class GetAllParksHandler : IRequestHandler<GetAllParksQuery, OneOf<List<ParkDto>>>
{
    private readonly TenantDbContext _context;

    public GetAllParksHandler(TenantDbContext context)
    {
        _context = context;
    }

    public async Task<OneOf<List<ParkDto>>> Handle(GetAllParksQuery request, CancellationToken cancellationToken)
    {
        var tenants = await _context.Tenants.ToListAsync(cancellationToken);

        var parkDtos = tenants.Select(x =>
        {
            var address = new AddressDto(x.Address.Street, x.Address.Number, x.Address.ZipCode, x.Address.City);
            var gpsLocation = new GpsLocationDto(x.Location.X, x.Location.Y);

            return new ParkDto(x.Id, x.Name, x.ImageUrl, address, gpsLocation);
        });

        return parkDtos.ToList();
    }
}