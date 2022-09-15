using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DomainFixture;
using DomainFixture.FixtureBuilder;
using Moq;
using Zeta.Common.Api;
using Zeta.Inpark.Contracts;
using Zeta.Inpark.Entities;
using Zeta.Inpark.Enums;
using Zeta.Inpark.Features.Speaks;
using Zeta.Inpark.ValueObjects;

namespace Zeta.Inpark.Tests.Features.Speaks.AalborgZoo;

[TestFixture]
[Category(Categories.Integration)]
public class GetAnimalSpeaksForTodayQueryTests : TestBase
{
    [Test]
    public async Task Handle_ShouldReturnSpeaks_ForCurrentDay()
    {
        //Arrange
        var today = DateTime.Today;
        var validSpeak = SetupSpeakWithOneSpeakTime(today.AddDays(-7), today.AddDays(7)).Create();
        var invalidSpeak = SetupSpeakWithOneSpeakTime(today.AddDays(-7), today.AddDays(-1)).Create();
        await AddRange(validSpeak, invalidSpeak);
        var query = new GetAnimalSpeaksForTodayQuery();
        
        //Act
        var response = await Send(query);

        //Assert
        response.Value.Should().BeOfType<List<SpeakDto>>();
        var result = response.Value.As<List<SpeakDto>>();
        result.Should().HaveCount(1)
            .And.SatisfyRespectively(first =>
            {
                first.Start.Should().BeCloseTo(validSpeak.SpeakTimes.First().Range.Start, TimeSpan.FromSeconds(5));
            });
    }

    [Test]
    public async Task Handle_ShouldOnlyPickOneSpeakTime_WhenTwoSpeakTimesStartAtTheExactSameTime()
    {
        //Arrange
        var today = DateTime.Today;
        var startTime = today.AddDays(-1);
        var endTime = startTime.AddDays(7);
        await Add(
            Fixture.Valid<Speak>()
                .With(x => x.SpeakTimes, new List<SpeakTime>()
                {
                    CreateSpeakTime(startTime, endTime),
                    CreateSpeakTime(startTime, endTime.AddDays(1))
                })
                .Create()
        );
        var query = new GetAnimalSpeaksForTodayQuery();
        
        //Act
        var response = await Send(query);

        //Assert
        response.Value.Should().BeOfType<List<SpeakDto>>();
        var result = response.Value.As<List<SpeakDto>>();
        result.Should().HaveCount(1);
    }
    
    [Test]
    public async Task Handle_ShouldPickTheNearestStartDate_WhenTwoValidSpeakTimesOverlap()
    {
        //Arrange
        var today = DateTime.Today;
        var startTime = today.AddDays(-14);
        var endTime = startTime.AddDays(28);
        var speak = await Add(
            Fixture.Valid<Speak>()
                .With(x => x.SpeakTimes, new List<SpeakTime>()
                {
                    CreateSpeakTime(startTime, endTime),
                    CreateSpeakTime(startTime.AddDays(7), endTime.AddDays(-7))
                })
                .Create()
        );
        var query = new GetAnimalSpeaksForTodayQuery();
        
        //Act
        var response = await Send(query);

        //Assert
        response.Value.Should().BeOfType<List<SpeakDto>>();
        var result = response.Value.As<List<SpeakDto>>();
        result.Should().HaveCount(1)
            .And.SatisfyRespectively(first =>
            {
                first.Start.Should().Be(speak.SpeakTimes.Last().Range.Start);
                first.End.Should().Be(speak.SpeakTimes.Last().Range.End);
            });
    }

    
    [Test]
    public async Task Handle_ShouldNotReturnASpeak_WithoutAnySpeakTimes()
    {
        //Arrange
        await Add(Fixture.Valid<Speak>().Create());
        var query = new GetAnimalSpeaksForTodayQuery();
        
        //Act
        var response = await Send(query);

        //Assert
        response.Value.Should().BeOfType<List<SpeakDto>>();
        var result = response.Value.As<List<SpeakDto>>();
        result.Should().BeEmpty();
    }
    
    [Test]
    public async Task Handle_ShouldNotReturnSpeak_WhenItStartsTomorrow()
    {
        //Arrange
        var today = DateTime.Today;
        await Add(SetupSpeakWithOneSpeakTime(today.AddDays(1), today.AddDays(7)).Create());
        var query = new GetAnimalSpeaksForTodayQuery();
        
        //Act
        var response = await Send(query);

        //Assert
        response.Value.Should().BeOfType<List<SpeakDto>>();
        var result = response.Value.As<List<SpeakDto>>();
        result.Should().BeEmpty();
    }
    
    [Test]
    public async Task Handle_ShouldNotReturnSpeak_ThatEndedYesterday()
    {
        //Arrange
        var today = DateTime.Today;
        await Add(SetupSpeakWithOneSpeakTime(today.AddDays(-7), today.AddDays(-1)).Create());
        var query = new GetAnimalSpeaksForTodayQuery();
        
        //Act
        var response = await Send(query);

        //Assert
        response.Value.Should().BeOfType<List<SpeakDto>>();
        var result = response.Value.As<List<SpeakDto>>();
        result.Should().BeEmpty();
    }
    
    [Test]
    public async Task Handle_ShouldReturnSpeaks_WhenTheyStartedInAnotherYear()
    {
        // Arrange
        var today = new DateTime(2022, 04, 20);
        await Add(
            SetupSpeakWithOneSpeakTime(
                today.AddYears(-1).AddMonths(-1).AddDays(5), 
                today.AddDays(30)
            ).Create()
        );
        var clockMock = new Mock<IClock>();
        clockMock.Setup(x => x.Now)
            .Returns(today);
        var query = new GetAnimalSpeaksForTodayQuery();
        
        // Act
        var response = await Send(query, clockMock);
        
        // Assert
        response.Value.Should().BeOfType<List<SpeakDto>>();
        var result = response.Value.As<List<SpeakDto>>();
        result.Should().BeEmpty();
    }
    
    [Test]
    public async Task Handle_ShouldReturnSpeaks_OrderedByStartDate()
    {
        //Arrange
        var today = new DateTime(2022, 04, 20);
        var speaks = Enumerable.Range(9, 0)
            .Reverse()
            .Select(i =>
                SetupSpeakWithOneSpeakTime(
                    today.AddDays(-7).AddHours(10 + i),
                    today.AddDays(30)
                )
                .Create()
            );
        await AddRange(speaks);
    
        var clockMock = new Mock<IClock>();
        clockMock.Setup(x => x.Now)
            .Returns(today);
        var query = new GetAnimalSpeaksForTodayQuery();
        
        //Act
        var response = await Send(query, clockMock);
        
        //Assert
        response.Value.Should().BeOfType<List<SpeakDto>>();
        var result = response.Value.As<List<SpeakDto>>();
        result.Should().BeInAscendingOrder(x => x.Start);
    }

    private const WeekDay AllDays = WeekDay.Monday | WeekDay.Tuesday | WeekDay.Wednesday | WeekDay.Thursday |
                                      WeekDay.Friday | WeekDay.Saturday | WeekDay.Sunday;

    private static FixtureBuilder<Speak> SetupSpeakWithOneSpeakTime(DateTime start, DateTime end, WeekDay days = AllDays)
    {
        return Fixture.Valid<Speak>()
            .With(
                x => x.SpeakTimes,
                new List<SpeakTime>()
                {
                    CreateSpeakTime(start, end, days)
                });
    }
    
    private static SpeakTime CreateSpeakTime(DateTime start, DateTime end, WeekDay days = AllDays)
    {
        return Fixture.Valid<SpeakTime>()
            .With(x => x.Range, TimeRange.From(start, end))
            .With(x => x.Days, days)
            .Create();
    }
}