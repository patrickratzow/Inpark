using DomainFixture;
using Moq;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Zeta.Inpark;
using Zeta.Inpark.Entities;
using Zeta.Inpark.Features.ParkEvents;
using Zeta.Inpark.Features.ParkEvents.Interfaces;
using Zeta.Inpark.ValueObjects;
using Zoo.Inpark.Contracts;

namespace Zoo.Inpark.Tests.Features.ParkEvents;
[TestFixture]
[Category(Categories.Integration)]
public class GetParkEventsQueryTests : TestBase
{
    /*
    [Test]
    public async Task Handle_ShouldFindAllParkEventsInDatabase()
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

    [Test]
    public async Task Handle_ShouldFindAllParkEventsInDatabase_WithCorrectDate()
    {
        // Arrange
        var today = new DateTime(2022, 5, 5);
        var parkEvent = await Add(Fixture.Valid<ParkEvent>()
            .With(x => x.Range, TimeRange.From(today, today.AddDays(1)))
            .Create());
        var context = GetRequiredService<InparkDbContext>();
        var mapper = GetRequiredService<IParkEventMapper>();
        var clock = new Mock<IClock>();
        clock.Setup(x => x.Today)
            .Returns(today);
        var handler = new GetParkEventsQueryQueryHandler(context, clock.Object, mapper);
        var query = new GetParkEventsQuery();

        // Act
        var response = await handler.Handle(query, CancellationToken.None);

        // Assert
        response.Value.Should().BeOfType<List<ParkEventDto>>();
        var result = response.Value.As<List<ParkEventDto>>();
        result.Should().HaveCount(1)
            .And.SatisfyRespectively(first => {
                first.Id.Should().Be(parkEvent.Id);
            });
    }

    [Test]
    public async Task Handle_ShouldFindAllParkEventsInDatabase_WithIncorrectDate()
    {
        // Arrange
        var today = new DateTime(2022, 5, 5);
        var parkEvent = await Add(Fixture.Valid<ParkEvent>()
            .With(x => x.Range, TimeRange.From(today.AddDays(-2), today.AddDays(-1)))
            .Create());
        var context = GetRequiredService<InparkDbContext>();
        var mapper = GetRequiredService<IParkEventMapper>();
        var clock = new Mock<IClock>();
        clock.Setup(x => x.Today)
            .Returns(today);
        var handler = new GetParkEventsQueryQueryHandler(context, clock.Object, mapper);
        var query = new GetParkEventsQuery();

        // Act
        var response = await handler.Handle(query, CancellationToken.None);

        // Assert
        response.Value.Should().BeOfType<List<ParkEventDto>>();
        var result = response.Value.As<List<ParkEventDto>>();
        result.Should().BeEmpty();
    }
    */
}

