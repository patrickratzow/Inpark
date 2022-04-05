using System.Reflection;
using DomainFixture;
using NUnit.Framework;
using Zoo.Common.Api;
using Zoo.Payments.Common;

namespace Zoo.Payments.Tests;

[SetUpFixture]
public class Testing
{
    [OneTimeSetUp]
    public void RunBeforeAnyTests()
    {
        Assembly.Load(typeof(Assembly).Assembly.GetName());
        
        FluentTests.AddBase(typeof(Entity));
        FluentTests.AddAssembly(typeof(Entity).Assembly);
        FluentTests.AddAssembly(typeof(DependencyInjection).Assembly);
    }
}