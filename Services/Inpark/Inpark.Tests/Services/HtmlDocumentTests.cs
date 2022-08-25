using Zeta.Inpark.Services;

namespace Zoo.Inpark.Tests.Services;

[TestFixture]
[Category(Categories.Unit)]
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
        var input = "<p>Testing</br> meme</p>";
        var document = _transformer.Load(input);
        
        // Act
        var meme = document.Parse();

        // Assert
        meme.Should().NotBeNull();
    }

    [Test]
    public void Advanced()
    {
        // Arrange
        var input =
            "<p><br />Strudsen er den største nulevende fugl, den lægger det største æg af alle nulevende væsener, og den er det hurtigste tobenede dyr, der findes. En struds som flygter fra et rovdyr kan nå op på 70 kilometer i timen.<br /><br />Der findes i dag fem strudsearter: Nanduen i Sydamerika, emuen i Australien, kiwien i New Zealand, strudsen i Afrika samt kasuaren i Ny Guinea.<br /><br />Det er ikke rigtigt at strudsen gemmer sit hoved i sandet. Denne misforståelse kan være opstået, da det på lang afstand kan være svært at se hovedet på en græssende struds.<br /><br />Strudse holder oftest sammen i grupper bestående af én han og op til 15 hunner. Blandt disse hunner har hannen sin førstedame, som på territoriet vælger en fordybning, som hannen på forhånd har lavet. Her lægger hun sine æg, hvorefter de andre hunner i gruppen kommer til. Udrugning klares af hannen og hans foretrukne hun. Arbejdet fordeles således at hannen ruger om natten og hunnen ruger om dagen. Et strudseæg vejer omkring 1500 gram, som svarer til cirka 20 hønseæg.<br /><br />Strudsen har også et meget godt syn og har det største øje af alle landlevende dyr.</p>";
        var document = _transformer.Load(input);
        
        // Act
        var meme = document.Parse();

        // Assert
        meme.Should().NotBeNull();
    }
    
    [Test]
    public void List()
    {
        // Arrange
        var input = "<ul><li>Hi</li><li>Meme</li></ul>";
        var document = _transformer.Load(input);
        
        // Act
        var meme = document.Parse();

        // Assert
        meme.Should().NotBeNull();
    }
}