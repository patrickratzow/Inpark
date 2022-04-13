using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using DomainFixture;
using Zoo.Inpark.Contracts;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Features.OpeningHours;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Tests.Features.OpeningHours;

[TestFixture]
[Category(Categories.Integration)]
public class GetOpeningHoursForTodayQueryTests : TestBase
{
    [Test]
    public async Task Handle_ShouldFindTestsFor_Today()
    {
        // Arrange
        var start = (DateTimeOffset)DateTime.Today;
        var end = start.AddDays(1);
        var range = TimeRange.From(start, end);
        var openingHour = await Add(
            Fixture.Valid<OpeningHour>()
                .With(x => x.Range, range)
                .Create()
        );
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
    public async Task Handle_ShouldNotFindTestsFor_Tomorrow()
    {
        // Arrange
        var start = (DateTimeOffset)DateTime.Today.AddDays(1);
        var end = start.AddDays(1);
        var range = TimeRange.From(start, end);
        await Add(
            Fixture.Valid<OpeningHour>()
                .With(x => x.Range, range)
                .Create()
        );
        var query = new GetOpeningHoursForTodayQuery();

        // Act
        var response = await Send(query);

        // Assert
        response.Value.Should().BeOfType<List<OpeningHourDto>>();
        var result = response.Value.As<List<OpeningHourDto>>();
        result.Should().BeEmpty();
    }
    
    [Test]
    public async Task Handle_ShouldNotFindTestsFor_Yesterday()
    {
        // Arrange
        var start = (DateTimeOffset)DateTime.Today.AddDays(-1);
        var end = start.AddDays(1);
        var range = TimeRange.From(start, end);
        await Add(
            Fixture.Valid<OpeningHour>()
                .With(x => x.Range, range)
                .Create()
        );
        var query = new GetOpeningHoursForTodayQuery();

        // Act
        var response = await Send(query);

        // Assert
        response.Value.Should().BeOfType<List<OpeningHourDto>>();
        var result = response.Value.As<List<OpeningHourDto>>();
        result.Should().BeEmpty();
    }
}