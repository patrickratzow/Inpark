using Zeta.Inpark.Contents;

namespace Zeta.Inpark.Tests.Contents;

[TestFixture]
[Category(Categories.Unit)]
public class ContentXmlSerializerTests
{
    [Test]
    public void Serialize_ShouldSerializeBasicElement()
    {
        // Arrange
        var root = new ContentElement(
            "text",
            new(),
            new(),
            "Hello World"
        );

        // Act
        var result = ContentXmlSerializer.Serialize(root);
        
        // Assert
        result.Should().Be("<text>Hello World</text>");
    }
    
    [Test]
    public void Serialize_ShouldSerializeAttributes()
    {
        // Arrange
        var root = new ContentElement(
            "text",
            new()
            {
                { "id", "foo" },
                { "name", "bar" }
            },
            new(),
            "Hello World"
        );

        // Act
        var result = ContentXmlSerializer.Serialize(root);
        
        // Assert
        result.Should().Be("<text id=\"foo\" name=\"bar\">Hello World</text>");
    }
    
    [Test]
    public void Serialize_ShouldSerializeChildren()
    {
        // Arrange
        var root = new ContentElement(
            "container",
            new(),
            new()
            {
                new("text", new(), new(), "Hello World"),
            }
        );

        // Act
        var result = ContentXmlSerializer.Serialize(root);
        
        // Assert
        result.Should().Be(  "<container>\n" 
                           + "  <text>Hello World</text>\n" 
                           + "</container>");
    }
}