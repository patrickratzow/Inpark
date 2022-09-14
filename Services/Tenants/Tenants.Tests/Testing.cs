using System.IO;
using System.Threading.Tasks;
using DomainFixture;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using NUnit.Framework;
using Respawn;
using Respawn.Graph;
using Zeta.Inpark.Tenants.Common;

namespace Zeta.Inpark.Tenants.Tests;

[SetUpFixture]
public class Testing
{
    private static IConfigurationRoot _configuration = null!;
    private static IServiceScopeFactory _scopeFactory = null!;
    private static Checkpoint _checkpoint = null!;
    private static IServiceScope _scope = null!;
    public static IServiceScope Scope => _scope;
    public static TenantDbContext DbContext => Scope.ServiceProvider.GetRequiredService<TenantDbContext>();
    
    [OneTimeSetUp]
    public void RunBeforeAnyTests()
    {
        FluentTests.AddBase(typeof(Entity));
        FluentTests.AddBase(typeof(ValueObject));
        FluentTests.AddAssembly(typeof(Zoo.Common.Api.ResponseMapperDependencyInjection).Assembly);

        var path = Directory.GetCurrentDirectory();
        var builder = new ConfigurationBuilder()
            .SetBasePath(path)
            .AddJsonFile("appsettings.json", true, true)
            .AddJsonFile("appsettings.Development.json", true, true)
            .AddEnvironmentVariables();

        _configuration = builder.Build();
        var env = Mock.Of<IWebHostEnvironment>(w =>
            w.EnvironmentName == "Development" &&
            w.ApplicationName == "AspNetCore");

        var services = new ServiceCollection();

        services.AddSingleton<IConfiguration>(_configuration);
        services.AddSingleton(env);
        services.AddLogging();
        services.AddTenant(_configuration);

        _scopeFactory = services.BuildServiceProvider().GetRequiredService<IServiceScopeFactory>();

        ResetScope();

        _checkpoint = new Checkpoint
        {
            SchemasToInclude = new[]
            {
                "dbo"
            },
            TablesToIgnore = new Table[]
            {
                "__EFMigrationsHistory"
            },
            DbAdapter = DbAdapter.SqlServer
        };

        EnsureDatabase();
    }

    private static void EnsureDatabase()
    {
        DbContext.Database.Migrate();
    }

    public static IServiceScope CreateScope() => _scopeFactory.CreateScope();
    public static void ResetScope() => _scope = CreateScope();

    public static async Task ResetState()
    {
        var connectionString = _configuration.GetConnectionString("TenantConnection");
   
        await _checkpoint.Reset(connectionString);
    }

    [OneTimeTearDown]
    public void RunAfterAnyTests() { }
    
    public class TestMemoryCache : IMemoryCache
    {
        public void Dispose() { }

        public ICacheEntry CreateEntry(object key) { return new Mock<ICacheEntry>().Object; }

        public void Remove(object key) {}

        public bool TryGetValue(object key, out object value)
        {
            value = null!;
        
            return false; 
        }
    }
}