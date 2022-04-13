using System.Reflection;
using Microsoft.EntityFrameworkCore;
using Zoo.Inpark.Common;
using Zoo.Inpark.Entities;

namespace Zoo.Inpark;

public class InparkDbContext : DbContext
{
    public InparkDbContext(DbContextOptions<InparkDbContext> options) : base(options) { }

    public DbSet<Animal> Animals { get; set; } = null!;

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Ignore<DomainEvent>();

        modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());

        base.OnModelCreating(modelBuilder);
    }
}