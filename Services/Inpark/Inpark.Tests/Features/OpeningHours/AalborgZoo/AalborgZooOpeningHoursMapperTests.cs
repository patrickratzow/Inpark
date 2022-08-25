using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Moq;
using Zeta.Inpark.Enums;
using Zeta.Inpark.Features.OpeningHours.AalborgZoo;

namespace Zoo.Inpark.Tests.Features.OpeningHours.AalborgZoo;

[TestFixture]
[Category(Categories.Unit)]
public class AalborgZooOpeningHoursMapperTests
{
    private Mock<ILogger<AalborgZooOpeningHoursMapper>> _loggerMock = null!;
    private AalborgZooOpeningHoursMapper _mapper = null!;
    
    [SetUp]
    public void Setup()
    {
        _loggerMock = new();
        _mapper = new(_loggerMock.Object);
    }
    
    [Test]
    public async Task Parse_ShouldReturn_ListOfOpeningHours()
    {
        // Arrange
        const string input = "{\"items\":[{\"item\":{\"title\":null,\"description\":null,\"url\":null,\"content\":[],\"properties\":{\"times\":[{\"special\":false,\"openClosed\":\"open\",\"weekDays\":[\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\"],\"start\":\"2022-04-01T10:00:00\",\"header\":\"Aalborg Zoo - Hverdag\",\"end\":\"2022-04-29T17:00:00\",\"type\":\"Aalborg Zoo\"},{\"special\":false,\"openClosed\":\"open\",\"weekDays\":[\"Saturday\",\"Sunday\"],\"start\":\"2022-04-01T10:00:00\",\"header\":\"Aalborg Zoo - Weekend\",\"end\":\"2022-04-29T18:00:00\",\"type\":\"Aalborg Zoo\"},{\"special\":true,\"openClosed\":\"open\",\"weekDays\":[\"Thursday\",\"Friday\",\"Saturday\",\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\"],\"start\":\"2022-04-11T10:00:00\",\"header\":\"Aalborg Zoo - P\u00E5ske\",\"end\":\"2022-04-18T18:00:00\",\"type\":\"Aalborg Zoo\"}]}},\"score\":0.0}],\"itemsTotal\":1,\"facetOptions\":{}}";
        
        // Act
        var response = await _mapper.Parse(input);
        
        // Assert
        response.IsSuccess(out var result).Should().BeTrue();
        result.Should().HaveCount(3);
    }
    
    [Test]
    public async Task Parse_ShouldDecode_FlagsForWeekdays()
    {
        // Arrange
        const string input = "{\"items\":[{\"item\":{\"title\":null,\"description\":null,\"url\":null,\"content\":[],\"properties\":{\"times\":[{\"special\":false,\"openClosed\":\"open\",\"weekDays\":[\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\"],\"start\":\"2022-04-01T10:00:00\",\"header\":\"Aalborg Zoo - Hverdag\",\"end\":\"2022-04-29T17:00:00\",\"type\":\"Aalborg Zoo\"},{\"special\":false,\"openClosed\":\"open\",\"weekDays\":[\"Saturday\",\"Sunday\"],\"start\":\"2022-04-01T10:00:00\",\"header\":\"Aalborg Zoo - Weekend\",\"end\":\"2022-04-29T18:00:00\",\"type\":\"Aalborg Zoo\"},{\"special\":true,\"openClosed\":\"open\",\"weekDays\":[\"Thursday\",\"Friday\",\"Saturday\",\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\"],\"start\":\"2022-04-11T10:00:00\",\"header\":\"Aalborg Zoo - P\u00E5ske\",\"end\":\"2022-04-18T18:00:00\",\"type\":\"Aalborg Zoo\"}]}},\"score\":0.0}],\"itemsTotal\":1,\"facetOptions\":{}}";
        
        // Act
        var response = await _mapper.Parse(input);
        
        // Assert
        response.IsSuccess(out var result).Should().BeTrue();
        var first = result!.First();
        first.Days.Should().HaveFlag(WeekDay.Monday)
            .And.HaveFlag(WeekDay.Tuesday)
            .And.HaveFlag(WeekDay.Wednesday)
            .And.HaveFlag(WeekDay.Thursday)
            .And.HaveFlag(WeekDay.Friday)
            .And.NotHaveFlag(WeekDay.Saturday)
            .And.NotHaveFlag(WeekDay.Sunday)
            .And.NotBe(WeekDay.None);
    }
    
    [Test]
    public async Task Parse_ShouldReturn_ErrorIfInvalidResponse()
    {
        // Arrange
        const string input = "{\"items\":[{\"item\":{\"title\":null,\"description\":null,\"url\":null,\"content\":[],\"properties\":{\"time\":[{\"special\":false,\"openClosed\":\"open\",\"weekDays\":[\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\"],\"start\":\"2022-04-01T10:00:00\",\"header\":\"Aalborg Zoo - Hverdag\",\"end\":\"2022-04-29T17:00:00\",\"type\":\"Aalborg Zoo\"},{\"special\":false,\"openClosed\":\"open\",\"weekDays\":[\"Saturday\",\"Sunday\"],\"start\":\"2022-04-01T10:00:00\",\"header\":\"Aalborg Zoo - Weekend\",\"end\":\"2022-04-29T18:00:00\",\"type\":\"Aalborg Zoo\"},{\"special\":true,\"openClosed\":\"open\",\"weekDays\":[\"Thursday\",\"Friday\",\"Saturday\",\"Sunday\",\"Monday\",\"Tuesday\",\"Wednesday\"],\"start\":\"2022-04-11T10:00:00\",\"header\":\"Aalborg Zoo - P\u00E5ske\",\"end\":\"2022-04-18T18:00:00\",\"type\":\"Aalborg Zoo\"}]}},\"score\":0.0}],\"itemsTotal\":1,\"facetOptions\":{}}";
        
        // Act
        var response = await _mapper.Parse(input);
        
        // Assert
        response.IsError().Should().BeTrue();
    }
}