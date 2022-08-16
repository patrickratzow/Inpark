using Microsoft.EntityFrameworkCore;
using Zeta.Inpark.Maps.Entities;

namespace Zeta.Inpark.Maps;

public class MapsDbContext : DbContext
{
    public DbSet<User> Users { get; set; }
    
    public MapsDbContext(DbContextOptions<MapsDbContext> options) : base(options)
    {
    }
}