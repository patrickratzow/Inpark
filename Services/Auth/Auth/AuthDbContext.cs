using System.Reflection;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Zeta.Inpark.Auth.Entities;
using Tenant = Zeta.Inpark.Auth.Entities.Tenant;

namespace Zeta.Inpark.Auth;

public class AuthDbContext : DbContext
{
    private readonly ILoggerFactory _loggerFactory;
    private readonly DomainEventService _domainEventService;

    public DbSet<User> Users { get; set; } = null!;
    public DbSet<Tenant> Tenants { get; set; } = null!;
    
    // ReSharper disable once NotNullMemberIsNotInitialized
#pragma warning disable CS8618
    public AuthDbContext()
#pragma warning restore CS8618
    {
    }
    
    public AuthDbContext(
        DbContextOptions<AuthDbContext> options, 
        ILoggerFactory loggerFactory, 
        DomainEventService domainEventService
    ) : base(options)
    {
        _loggerFactory = loggerFactory;
        _domainEventService = domainEventService;
    }


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

    public override async Task<int> SaveChangesAsync(bool acceptAllChangesOnSuccess,
        CancellationToken cancellationToken = new())
    {
        SetTrackingDates();

        await DispatchEvents();
        
        return await base.SaveChangesAsync(acceptAllChangesOnSuccess, cancellationToken);
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
    
    private async Task DispatchEvents()
    {
        while (true)
        {
            var domainEventEntity = ChangeTracker
                .Entries<IHasDomainEvent>()
                .Select(x => x.Entity.DomainEvents)
                .SelectMany(x => x)
                .FirstOrDefault(domainEvent => !domainEvent.IsPublished);
            if (domainEventEntity == null) break;

            await _domainEventService.Publish(domainEventEntity);
        }
    }
}