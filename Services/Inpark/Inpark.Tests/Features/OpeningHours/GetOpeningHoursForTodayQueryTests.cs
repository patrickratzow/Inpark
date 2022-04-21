using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using DomainFixture;
using Moq;
using Zoo.Inpark.Contracts;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Enums;
using Zoo.Inpark.Features.OpeningHours;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Tests.Features.OpeningHours;

[TestFixture]
[Category(Categories.Integration)]
public class GetOpeningHoursForTodayQueryTests : TestBase
{
    [Test]
    public async Task Handle_ShouldFindOpeningHoursFor_Today()
    {
        // Arrange
        var time = DateTime.Today;
        var range = TimeRange.From(time, time);
        var openingHour = await AddOpeningHour(range);
        var query = new GetOpeningHoursForTodayQuery();

        // Act
        var response = await Send(query);

        // Assert
        response.Value.Should().BeOfType<List<OpeningHourDto>>();
        var result = response.Value.As<List<OpeningHourDto>>();
        result.Should().HaveCount(1)
            .And.SatisfyRespectively(
                dto =>
                {
                    dto.Start.Should().Be(openingHour.Range.Start);
                    dto.End.Should().Be(openingHour.Range.End);
                }
            );
    }
    
    [Test]
    public async Task Handle_ShouldNotFindOpeningHoursFor_Tomorrow()
    {
        // Arrange
        var time = DateTime.Today.AddDays(1);
        var range = TimeRange.From(time, time);
        await AddOpeningHour(range);
        var query = new GetOpeningHoursForTodayQuery();

        // Act
        var response = await Send(query);

        // Assert
        response.Value.Should().BeOfType<List<OpeningHourDto>>();
        var result = response.Value.As<List<OpeningHourDto>>();
        result.Should().BeEmpty();
    }
    
    [Test]
    public async Task Handle_ShouldNotFindOpeningHoursFor_Yesterday()
    {
        // Arrange
        var time = DateTime.Today.AddDays(-1);
        var range = TimeRange.From(time, time);
        await AddOpeningHour(range);
        var query = new GetOpeningHoursForTodayQuery();

        // Act
        var response = await Send(query);

        // Assert
        response.Value.Should().BeOfType<List<OpeningHourDto>>();
        var result = response.Value.As<List<OpeningHourDto>>();
        result.Should().BeEmpty();
    }

    [Test]
    public async Task Handle_ShouldNotFindOpeningHoursForTodayWhen_TheCurrentDayIsNotADayItCountsFor()
    {
        // Arrange
        var start = DateTime.Today.AddDays(-1);
        var end = start.AddDays(7);
        var range = TimeRange.From(start, end);
        await AddOpeningHour(range, WeekDay.Saturday | WeekDay.Sunday);
        var context = GetRequiredService<InparkDbContext>();
        var clockMock = new Mock<IClock>();
        clockMock.Setup(x => x.Today)
            .Returns(new DateTime(2022, 04, 15));
        var query = new GetOpeningHoursForTodayQuery();
        var handler = new GetOpeningHoursForTodayQueryHandler(context, clockMock.Object);
        
        // Act
        var response = await handler.Handle(query, CancellationToken.None);
        
        // Assert
        response.Value.Should().BeOfType<List<OpeningHourDto>>();
        var result = response.Value.As<List<OpeningHourDto>>();
        result.Should().BeEmpty();
        clockMock.VerifyAll();
    }
    
    [Test]
    public async Task Handle_ShouldUseClosestOpeningHour_WhenSelecting()
    {
        // Arrange
        var monthRange = TimeRange.From(
            new DateTime(2022, 04, 01),
            new DateTime(2022, 04, 30)
        );
        var weekRange = TimeRange.From(
            new DateTime(2022, 04, 11),
            new DateTime(2022, 04, 18)
        );
        var today = new DateTime(2022, 04, 15);
        await AddOpeningHour(monthRange);
        await AddOpeningHour(weekRange);
        
        var context = GetRequiredService<InparkDbContext>();
        var clockMock = new Mock<IClock>();
        clockMock.Setup(x => x.Today).Returns(today);
        var query = new GetOpeningHoursForTodayQuery();
        var handler = new GetOpeningHoursForTodayQueryHandler(context, clockMock.Object);
        
        // Act
        var response = await handler.Handle(query, CancellationToken.None);
        
        // Assert
        response.Value.Should().BeOfType<List<OpeningHourDto>>();
        var result = response.Value.As<List<OpeningHourDto>>();
        result.Should().HaveCount(1)
            .And.SatisfyRespectively(first =>
            {
                first.Start.Should().Be(weekRange.Start);
                first.End.Should().Be(weekRange.End);
            });
        clockMock.VerifyAll();
    }
    
    [Test]
    public async Task Handle_ShouldFindOpeningHours_WhenTheMonthIsLowerThanTodaysMonth()
    {
        // Arrange
        var today = new DateTime(2022, 04, 15);
        var clockMock = new Mock<IClock>();
        clockMock.Setup(x => x.Today)
            .Returns(today);
        var range = TimeRange.From(new(2021, 06, 18), today);
        await AddOpeningHour(range);
        var context = GetRequiredService<InparkDbContext>();
        var query = new GetOpeningHoursForTodayQuery();
        var handler = new GetOpeningHoursForTodayQueryHandler(context, clockMock.Object);
        
        // Act
        var response = await handler.Handle(query, CancellationToken.None);
        
        // Assert
        response.Value.Should().BeOfType<List<OpeningHourDto>>();
        var result = response.Value.As<List<OpeningHourDto>>();
        result.Should().NotBeEmpty();
        clockMock.VerifyAll();
    }

    private async Task<OpeningHour> AddOpeningHour(TimeRange range, WeekDay days = WeekDay.Monday | WeekDay.Tuesday | WeekDay.Wednesday | WeekDay.Thursday | WeekDay.Friday | WeekDay.Saturday | WeekDay.Sunday)
    {
        return await Add(
            Fixture.Valid<OpeningHour>()
                .With(x => x.Range, range)
                .With(x => x.Days, days)
                .Create()
        );
    }
}