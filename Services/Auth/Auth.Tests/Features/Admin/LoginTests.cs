using System.Diagnostics;
using System.Threading.Tasks;
using Bogus;
using Zeta.Inpark.Auth.Features.Admin;
using Zeta.Inpark.Auth.Services;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Tests.Features.Admin;

[TestFixture]
public class LoginTests : TestBase
{
    [Test]
    public async Task Handler_ReturnsWrongLogin_WhenNoUserWithThatEmailExists()
    {
        // Arrange
        var password = "oMEGALUL45!";
        await Create<Auth.Entities.Admin>(f =>
            f.With(x => x.Password, CreatePassword(password))
        );
        var command = new Faker<Login.Command>()
            .CustomInstantiator(f =>
                new(
                    f.Internet.Email(),
                    password
                )
            )
            .Generate();
            
        // Act
        var result = await Send(command);
        
        // Assert
        result.Value.Should().BeOfType<Login.WrongLogin>();
    }
    
    [Test]
    public async Task Handler_ReturnsWrongLogin_WhenPasswordIsWrong()
    {
        // Arrange
        var password = "oMEGALUL45!";
        var user = await Create<Auth.Entities.Admin>(f =>
            f.With(x => x.Password, CreatePassword(password))
        );
        var command = new Faker<Login.Command>()
            .CustomInstantiator(f =>
                new(
                    user.EmailAddress.Value,
                    password + "5"
                )
            )
            .Generate();
            
        // Act
        var result = await Send(command);
        
        // Assert
        result.Value.Should().BeOfType<Login.WrongLogin>();
    }
    
    [Test]
    public async Task Handler_ReturnsResponse_WhenEverythingIsRight()
    {
        // Arrange
        var password = "oMEGALUL45!";
        var user = await Create<Auth.Entities.Admin>(f =>
            f.With(x => x.Password, CreatePassword(password))
        );
        var command = new Faker<Login.Command>()
            .CustomInstantiator(f =>
                new(
                    user.EmailAddress.Value,
                    password
                )
            )
            .Generate();
            
        // Act
        var result = await Send(command);
        
        // Assert
        result.Value.Should().BeOfType<Login.Response>();
    }
    
    [Test]
    public async Task Handler_TakesMinimum250MillisecondsToRun()
    {
        // Arrange
        var password = "oMEGALUL45!";
        var user = await Create<Auth.Entities.Admin>(f =>
            f.With(x => x.Password, CreatePassword(password))
        );
        var command = new Faker<Login.Command>()
            .CustomInstantiator(f =>
                new(
                    user.EmailAddress.Value,
                    password
                )
            )
            .Generate();
        var stopwatch = new Stopwatch();
            
        // Act
        stopwatch.Start();
        await Send(command);
        stopwatch.Stop();
        
        // Assert
        stopwatch.ElapsedMilliseconds.Should().BeGreaterThanOrEqualTo(250);
    }


    private Password CreatePassword(string input)
    {
        var passwordService = GetRequiredService<PasswordService>();

        return passwordService.CreatePassword(input);
    }
}