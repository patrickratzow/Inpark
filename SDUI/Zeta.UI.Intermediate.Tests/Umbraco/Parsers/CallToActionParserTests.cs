using Zeta.UI.Intermediate.Nodes;
using Zeta.UI.Intermediate.Umbraco.Parsers;
using Zeta.UI.Intermediate.Validation;

namespace Zeta.UI.Intermediate.Tests.Umbraco.Parsers;

[TestFixture]
[Category(Categories.Unit)]
public class CallToActionParserTests
{
    private JsonBuilder _input = null!;
    
    [SetUp]
    public void SetUp()
    {
        _input = JsonBuilder.FromJson("""
        {
            "externalPage": "https://example.com",
            "linkButtonText": "Click here"
        }
        """);
    }
    
    [Test]
    public void Should_Parse_All()
    {
        // Arrange
        var parser = new CallToActionParser(_input);
        
        // Act
        var result = parser.Parse();

        // Assert
        result.Should().NotBeNull();
        result.Should().BeOfType<CallToActionNode>();
        var node = result.As<CallToActionNode>();
        node.Url.Should().Be("https://example.com");
        node.Text.Should().Be("Click here");
    }
    
    [TestCase("externalPage")]
    [TestCase("linkButtonText")]    
    public void Should_Fail_Without_Key(string key)
    {
        // Arrange
        _input.Remove(key);
        var parser = new CallToActionParser(_input);

        // Act
        var result = () => parser.Parse();

        // Assert
        result.Should().Throw<ParsingValidationException>();
    }
}