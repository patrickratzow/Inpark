using System;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Moq;
using Moq.Protected;
using Zoo.Inpark.Features.Speaks.AalborgZoo;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Tests.Features.Speaks.AalborgZoo;

[TestFixture]
[Category(Categories.Unit)]
public class AalborgZooSpeaksRepositoryTests
{
    private Mock<HttpMessageHandler> _messageHandlerMock = null!;
    private AalborgZooSpeaksRepository _repository = null!;
    
    [SetUp]
    public void Setup()
    {
        _messageHandlerMock = new(MockBehavior.Strict);
        var httpClient = new HttpClient(_messageHandlerMock.Object)
        {
            BaseAddress = new("https://api.aalborgzoo.dk/api/")
        };
        var logger = new Mock<ILogger<AalborgZooSpeaksRepository>>();
        _repository = new(httpClient, logger.Object);
    }
    
    [Test]
    public async Task GetRange_ReturnsSuccessOn_ValidResponse()
    {
        // Arrange
        _messageHandlerMock
            .Protected()
            .Setup<Task<HttpResponseMessage>>(
                "SendAsync",
                ItExpr.IsAny<HttpRequestMessage>(),
                ItExpr.IsAny<CancellationToken>()
            )
            .ReturnsAsync(new HttpResponseMessage
            {
                StatusCode = HttpStatusCode.OK,
                Content = new StringContent("{}")
            })
            .Verifiable();
        var start = DateTimeOffset.Now;
        var end = start.AddDays(1);
        var timeRange = TimeRange.From(start, end);

        // Act
        var response = await _repository.GetRange(timeRange);
        
        // Assert
        response.IsSuccess(out var result).Should().BeTrue();
        result.Should().Be("{}");
        _messageHandlerMock.VerifyAll();
    }
}