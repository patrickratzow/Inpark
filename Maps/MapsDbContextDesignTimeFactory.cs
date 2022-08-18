using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace Zeta.Inpark.Maps;

public class MapsDbContextDesignTimeFactory : IDesignTimeDbContextFactory<MapsDbContext>
{
    public MapsDbContext CreateDbContext(string[] args)
    {
        var optionsBuilder = new DbContextOptionsBuilder<MapsDbContext>();
        var connectionString =
            "Server=tcp:sql-zeta-northeurope-dev-01.database.windows.net,1433;Initial Catalog=sqldb-zeta-northeurope-dev-maps;Persist Security Info=False;User ID=zeta;Password=floris11!!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
        optionsBuilder.UseSqlServer(connectionString);

        return new(optionsBuilder.Options, null!);
    }
}