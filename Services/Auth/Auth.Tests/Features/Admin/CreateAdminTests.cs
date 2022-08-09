using System;
using System.Threading.Tasks;
using Bogus;
using DomainFixture;
using MediatR;
using Zeta.Inpark.Auth.Features.Admin;

namespace Zeta.Inpark.Auth.Tests.Features.Admin;

[TestFixture]
[Category(Categories.Implementation)]
public class CreateAdminTests : TestBase
{
    [Test]
    public async Task Handle_ShouldCreateUser_WhenEmailAddressIsNotAlreadyUsed()
    {
        // Arrange
        await Add(Fixture.Valid<Auth.Entities.Admin>().Create());
        var command = new Faker<CreateAdmin.Command>()
            .CustomInstantiator(f =>
                new(
                    Guid.NewGuid(),
                    f.Internet.Email(),
                    f.Internet.Password()
                )
            )
            .Generate();
        
        // Act
        var response = await Send(command);
        
        // Assert
        response.Value.Should().BeOfType<Unit>();
        
        await ShouldFind<Auth.Entities.Admin>(command.Id);
    }
    
    [Test]
    public async Task Handle_ShouldReturnEmailAddressAlreadyUsed_WhenEmailAddressIsAlreadyUsed()
    {
        // Arrange
        var user = await Add(Fixture.Valid<Auth.Entities.Admin>().Create());
        var command = new Faker<CreateAdmin.Command>()
            .CustomInstantiator(f =>
                new(
                    Guid.NewGuid(),
                    user.EmailAddress.Value,
                    f.Internet.Password()
                )
            )
            .Generate();
        
        // Act
        var response = await Send(command);
        
        // Assert
        response.Value.Should().BeOfType<CreateAdmin.EmailAddressAlreadyUsed>();
        
        await ShouldNotFind<Auth.Entities.Admin>(command.Id);
    }
}