using DomainFixture;
using MediatR;
using Zeta.Inpark.Maps.Entities;
using Zeta.Inpark.Maps.Features;

namespace Zeta.Inpark.Maps.Tests.Features;

[Category(Categories.Integration)]
public class ProcessPingLocationTests : TestBase
{
    [Test]
    public async Task Handle_ShouldCreateUser_IfNoUserExisted()
    {
        // Arrange
        var command = await Create<ProcessPingLocation.Command>();
               
        // Act
        var result = await Send(command);
        
        // Assert
        result.Value.Should().BeOfType<Unit>();
        await ShouldFind<User>(command.UserId);
    }
    
    [Test]
    public async Task Handle_ShouldAddPingToUser()
    {
        // Arrange
        var command = await Create<ProcessPingLocation.Command>();
        
        // Act
        var result = await Send(command);
        
        // Assert
        result.Value.Should().BeOfType<Unit>();
        await ShouldFind<Ping>(command.UserId);
    }
}