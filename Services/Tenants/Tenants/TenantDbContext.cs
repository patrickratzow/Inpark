using System.Reflection;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Zeta.Inpark.Tenants.Common;
using Zeta.Inpark.Tenants.Entities;

namespace Zeta.Inpark.Tenants;

public class TenantDbContext : DbContext
{
    private readonly ILoggerFactory _loggerFactory;

    public TenantDbContext()
    {
    }

    public TenantDbContext(DbContextOptions<TenantDbContext> options, ILoggerFactory loggerFactory) : base(options)
    {
        _loggerFactory = loggerFactory;
    }

    public DbSet<Tenant> Tenants { get; set; } = null!;
    
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseLoggerFactory(_loggerFactory);
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Ignore<DomainEvent>();

        modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());

        base.OnModelCreating(modelBuilder);
    }

    public override Task<int> SaveChangesAsync(bool acceptAllChangesOnSuccess,
        CancellationToken cancellationToken = new())
    {
        SetTrackingDates();
        
        return base.SaveChangesAsync(acceptAllChangesOnSuccess, cancellationToken);
    }
    
    private void SetTrackingDates()
    {
        var entries = ChangeTracker.Entries()
            .Where(x => x.Entity is Entity)
            .Where(x => x.State is EntityState.Added or EntityState.Modified)
            .ToList();

        foreach (var entry in entries)
        {
            switch (entry.State)
            {
                case EntityState.Added:
                    SetPropertyValue(entry.Entity, nameof(Entity.CreatedAt), DateTimeOffset.UtcNow);
                    
                    break;
                case EntityState.Added or EntityState.Modified:
                    SetPropertyValue(entry.Entity, nameof(Entity.UpdatedAt), DateTimeOffset.UtcNow);
                    
                    break;
            }
        }
    }
    
    private static void SetPropertyValue(object entity, string propertyName, DateTimeOffset value)
    {
        var property = entity.GetType().GetProperty(propertyName, BindingFlags.Instance | BindingFlags.Public
            | BindingFlags.SetProperty | BindingFlags.GetProperty | BindingFlags.NonPublic);
        property!.SetValue(entity, value);
    }
}