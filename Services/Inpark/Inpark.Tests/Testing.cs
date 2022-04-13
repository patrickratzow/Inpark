﻿using System.IO;
using System.Threading.Tasks;
using DomainFixture;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using Respawn;
using Respawn.Graph;
using Zoo.Inpark.Common;

namespace Zoo.Inpark.Tests;

[SetUpFixture]
public class Testing
{
    private static IConfigurationRoot _configuration = null!;
    private static IServiceScopeFactory _scopeFactory = null!;
    private static Checkpoint _checkpoint = null!;
    private static IServiceScope _scope = null!;
    public static IServiceScope Scope => _scope;
    public static InparkDbContext DbContext => Scope.ServiceProvider.GetRequiredService<InparkDbContext>();
    
    [OneTimeSetUp]
    public void RunBeforeAnyTests()
    {
        FluentTests.AddBase(typeof(Entity));
        FluentTests.AddBase(typeof(ValueObject));
        FluentTests.AddAssembly(typeof(Zoo.Common.Api.DependencyInjection).Assembly);

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
        services.AddInpark(_configuration);

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
        var connectionString = _configuration.GetConnectionString("InparkConnection");
   
        await _checkpoint.Reset(connectionString);
    }

    [OneTimeTearDown]
    public void RunAfterAnyTests() { }
}