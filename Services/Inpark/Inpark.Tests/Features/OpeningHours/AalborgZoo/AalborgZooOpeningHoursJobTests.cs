using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Moq;
using Zeta.Inpark.Entities;
using Zeta.Inpark.Features.OpeningHours.AalborgZoo;
using Zeta.Inpark.Features.OpeningHours.Interfaces;

namespace Zeta.Inpark.Tests.Features.OpeningHours.AalborgZoo;

[TestFixture]
[Category(Categories.Integration)]
public class AalborgZooOpeningHoursJobTests : TestBase
{
    [Test]
    public async Task Execute_ShouldWork()
    {
        // Arrange
        var repository = GetRequiredService<IOpeningHoursRepository>();
        var mapper = GetRequiredService<IOpeningHoursMapper>();
        var logger = new Mock<ILogger<UpdateAalborgZooOpeningHoursCommandHandler>>();
        var context = GetRequiredService<InparkDbContext>();
        var sut = new UpdateAalborgZooOpeningHoursCommandHandler(repository, mapper, logger.Object, context);
        
        // Act
        await sut.Handle(new(), CancellationToken.None);
        
        // Assert
        var count = await Count<OpeningHour>();
        count.Should().BeGreaterThan(0);
    }
}