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
        var pingId = Guid.NewGuid();
        var userId = Guid.NewGuid();
        var latitude = 54.3f;
        var longitude = 10.1f;
        var command = new ProcessPingLocation.Command(pingId, userId, latitude, longitude);
               
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
        var user = await Add(User.Create(Guid.NewGuid()));
        var pingId = Guid.NewGuid();
        var userId = user.Id;
        var latitude = 54.3f;
        var longitude = 10.1f;
        var command = new ProcessPingLocation.Command(pingId, userId, latitude, longitude);
        
        // Act
        var result = await Send(command);
        
        // Assert
        result.Value.Should().BeOfType<Unit>();
        await ShouldFind<Ping>(command.PingId);
    }
}