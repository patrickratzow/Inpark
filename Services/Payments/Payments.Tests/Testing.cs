using DomainFixture;
using Zoo.Payments.Common;

namespace Zoo.Payments.Tests;

[SetUpFixture]
public class Testing
{
    [OneTimeSetUp]
    public void RunBeforeAnyTests()
    {
        FluentTests.AddBase(typeof(Entity));
        FluentTests.AddAssembly(typeof(DependencyInjection).Assembly);
    }
}