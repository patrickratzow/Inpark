using FluentAssertions;
using NUnit.Framework;
using Zoo.Inpark.Services;

namespace Zoo.Inpark.Tests.Services;

[TestFixture]
public class HtmlDocumentTests
{
    private IHtmlTransformer _transformer = null!;

    [SetUp]
    public void Setup()
    {
        _transformer = new HtmlTransformer();
    }
    
    [Test]
    public void Should()
    {
        // Arrange
        var input = "<p>Testing</p>";
        var document = _transformer.Load(input);
        
        // Act
        var meme = document.Parse();

        // Assert
        meme.Should().NotBeNull();
    }
}