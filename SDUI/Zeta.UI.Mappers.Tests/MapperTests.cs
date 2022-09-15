using Zeta.UI.Intermediate.Nodes;

namespace Zeta.UI.Mappers.Tests;

[TestFixture]
[Category(Categories.Unit)]
public class MapperTests : TestBase
{
    [Test]
    public async Task Map_Should_ReturnNode()
    {
        // Arrange
        var mapper = GetRequiredService<IMapper>();
        var imageNode = new ImageNode(
            "/media/smknzl34/boerged700x350.jpg",
            "",
            new(
                700,
                350
            )
        );
        
        // Act
        var result = await mapper.Map(imageNode);

        // Assert
        result.Should().NotBeNull();
    }
    
    [Test]
    public async Task Map_Should_MapChildren()
    {
        // Arrange
        var mapper = GetRequiredService<IMapper>();
        var sectionNode = new SectionNode();
        sectionNode.AddChild(new TextNode(
            "foobar",
            TextKind.Text,
            false
        ));
     
        // Act
        var result = await mapper.Map(sectionNode);

        // Assert
        result.Should().NotBeNull();
        result.Children.Should().HaveCount(1);
    }
    
    [Test]
    public async Task Map_Should_TransformCallToAction()
    {
        // Arrange
        var mapper = GetRequiredService<IMapper>();
        var node = new CallToActionNode(
            "https://example.com",
            "Go to Example.com"
        );

        // Act
        var result = await mapper.Map(node);

        // Assert
        result.Should().NotBeNull();
        result.Attributes.Should().ContainKey("action")
            .And.ContainValue("https://example.com");
    }
}