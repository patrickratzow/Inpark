using DomainFixture;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zoo.Inpark.Contracts;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Features.Events;

namespace Zoo.Inpark.Tests.Features.ParkEvents;
[TestFixture]
[Category(Categories.Integration)]
public class GetParkEventsQueryTests : TestBase
{
    [Test]
    public async Task Handle_ShouldFindAllAnimalsInDatabase()
    {
        // Arrange
        await AddRange(Fixture.Valid<ParkEvent>().CreateMany(5));
        var query = new GetParkEventsQuery();

        // Act
        var response = await Send(query);

        // Assert
        response.Value.Should().BeOfType<List<ParkEventDto>>();
        var result = response.Value.As<List<ParkEventDto>>();
        result.Should().HaveCount(5);
    }
}

