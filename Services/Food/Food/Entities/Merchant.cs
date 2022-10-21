using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Food.Common;
using Zeta.Inpark.Food.ValueObjects;
using Success = OneOf.Types.Success;

namespace Zeta.Inpark.Food.Entities;

public class Merchant : Entity
{
    public Guid Id { get; private set; }
    public MerchantName Name { get; private set; } = null!;
    public CvrNumber CvrNumber { get; private set; } = null!;
    private List<Shop> _shops = new();
    public IReadOnlyCollection<Shop> Shops
    {
        get => _shops;
        private set => _shops = value.ToList();
    }

    private Merchant()
    {
    }
    
    public static Merchant Create(Guid id, MerchantName name, CvrNumber cvrNumber)
    {
        var instance = new Merchant
        {
            Id = id,
            Name = name,
            CvrNumber = cvrNumber
        };
        instance.Validate();

        return instance;
    }
    
    public Result<string> AddShop(Shop shop)
    {
        if (_shops.Any(x => x.Id == shop.Id)) return "Shop already assigned to this merchant";
        
        _shops.Add(shop);

        return new Success();
    }
}

public class MerchantValidator : AbstractValidator<Merchant>
{
    public MerchantValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotNull();
        RuleFor(x => x.CvrNumber).NotNull();
        RuleFor(x => x.Shops).NotNull();
    }
}

public class MerchantConfiguration : IEntityTypeConfiguration<Merchant>
{
    public void Configure(EntityTypeBuilder<Merchant> builder)
    {
        builder.ToTable("Merchants");
        
        builder.OwnsOne(x => x.Name, b =>
        {
            b.Property(x => x.Value).HasColumnName("Name");
        });
        
        builder.HasMany(x => x.Shops)
            .WithOne();

        builder.OwnsOne(x => x.CvrNumber, b =>
        {
            b.HasIndex(x => x.Value).IsUnique();
            b.Property(x => x.Value).HasColumnName("CvrNumber");
        });
    }
}