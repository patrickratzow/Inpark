using System.Reflection;
using Microsoft.EntityFrameworkCore;
using Zoo.Inpark.Common;
using Zoo.Inpark.Entities;

namespace Zoo.Inpark;

public class InparkDbContext : DbContext
{
    public InparkDbContext(DbContextOptions<InparkDbContext> options) : base(options) { }

    public DbSet<Animal> Animals { get; set; } = null!;
    public DbSet<OpeningHour> OpeningHours { get; set; } = null!;
    public DbSet<Speak> Speaks { get; set; } = null!;
    public DbSet<ParkEvent> ParkEvents { get; set; } = null!;

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