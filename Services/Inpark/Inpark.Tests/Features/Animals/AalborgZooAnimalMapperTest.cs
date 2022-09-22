using System;
using System.Collections.Generic;
using Microsoft.Extensions.Logging;
using Moq;
using Zeta.Inpark.Features.Animals.AalborgZoo;
using Zeta.Inpark.Models;
using Zeta.Inpark.Services;

namespace Zeta.Inpark.Tests.Features.Animals;

[TestFixture]
[Category(Categories.Unit)]
public class AalborgZooAnimalMapperTest : TestBase
{
    private Content Spacer()
    {
        return new Content(new object(), "spacer", Array.Empty<Content>());
    }

    private Content Text(string text)
    {
        return new Content(text, "text", Array.Empty<Content>());
    }

    private Content ListItem(string text)
    {
        return new Content(new object(), "listitem", new List<Content>
        {
            Text(text)
        });
    }

    [Test]
    public void ParseContent_ShouldReturnExpectedOutput_WhenGivenInput()
    {
        //Arrange
        var htmlTransformer = GetRequiredService<IHtmlTransformer>();
        var logger = new Mock<ILogger<AalborgZooAnimalMapper>>();

        var parseContent = new AalborgZooAnimalMapper(htmlTransformer, logger.Object);
        var content =
            "[{\"layout\":{\"column\":\"grid-12\"},\"type\":\"layout\",\"content\":[[{\"text\":\"Afrikansk struds\",\"type\":\"headline\"}]]},{\"layout\":{\"column\":\"grid-6-6\"},\"type\":\"layout\",\"content\":[[{\"text\":\"<p><br />Strudsen er den største nulevende fugl, den lægger det største æg af alle nulevende væsener, og den er det hurtigste tobenede dyr, der findes. En struds som flygter fra et rovdyr kan nå op på 70 kilometer i timen.<br /><br />Der findes i dag fem strudsearter: Nanduen i Sydamerika, emuen i Australien, kiwien i New Zealand, strudsen i Afrika samt kasuaren i Ny Guinea.<br /><br />Det er ikke rigtigt at strudsen gemmer sit hoved i sandet. Denne misforståelse kan være opstået, da det på lang afstand kan være svært at se hovedet på en græssende struds.<br /><br />Strudse holder oftest sammen i grupper bestående af én han og op til 15 hunner. Blandt disse hunner har hannen sin førstedame, som på territoriet vælger en fordybning, som hannen på forhånd har lavet. Her lægger hun sine æg, hvorefter de andre hunner i gruppen kommer til. Udrugning klares af hannen og hans foretrukne hun. Arbejdet fordeles således at hannen ruger om natten og hunnen ruger om dagen. Et strudseæg vejer omkring 1500 gram, som svarer til cirka 20 hønseæg.<br /><br />Strudsen har også et meget godt syn og har det største øje af alle landlevende dyr.</p>\",\"type\":\"text\"}],[{\"text\":\"<ul>\\n<li>Udbredelse: På åbne savanneområder i Øst- og Sydafrika. Der findes også vilde strudse i Australien, som nedstammer fra strudse, der har været holdt i fangenskab</li>\\n<li>Bestand: Strudsen var tidligere almindelig i store dele af Afrika. Den er i dag gået stærkt tilbage i antal, primært fordi den har været efterstræbt af mennesker. Strudsen er i dag truet.</li>\\n<li>Vægt: Op til 135 kilo</li>\\n<li>Højde: Ca. 2,5 meter</li>\\n<li>Kropslængde: Op til 2,75 meter</li>\\n<li>Kønsmoden: Fra 3-4-årsalderen. Hunner kan blive kønsmodne allerede i 2-årsalderen</li>\\n<li>Rugeperiode: Cirka 42 dage</li>\\n<li>Antal æg: 8-10 æg pr. hun. I en strudserede kan der være helt op til 60 æg lagt af forskellige hunner. Hvert æg vejer cirka 1500 gram</li>\\n<li>Føde: Frø, græs, blade og blomster, insekter og øgler.</li>\\n<li>Levealder: 20-30 år</li>\\n</ul>\",\"type\":\"text\"}]]}]";

        var expectedContent = new List<IContent>
        {
            new Content(new object(),
                "container",
                new List<Content>()
                {
                    Spacer(),
                    Text(
                        "Strudsen er den største nulevende fugl, den lægger det største æg af alle nulevende væsener, og den er det hurtigste tobenede dyr, der findes. En struds som flygter fra et rovdyr kan nå op på 70 kilometer i timen."),
                    Spacer(),
                    Spacer(),
                    Text(
                        "Der findes i dag fem strudsearter: Nanduen i Sydamerika, emuen i Australien, kiwien i New Zealand, strudsen i Afrika samt kasuaren i Ny Guinea."),
                    Spacer(),
                    Spacer(),
                    Text(
                        "Det er ikke rigtigt at strudsen gemmer sit hoved i sandet. Denne misforståelse kan være opstået, da det på lang afstand kan være svært at se hovedet på en græssende struds."),
                    Spacer(),
                    Spacer(),
                    Text(
                        "Strudse holder oftest sammen i grupper bestående af én han og op til 15 hunner. Blandt disse hunner har hannen sin førstedame, som på territoriet vælger en fordybning, som hannen på forhånd har lavet. Her lægger hun sine æg, hvorefter de andre hunner i gruppen kommer til. Udrugning klares af hannen og hans foretrukne hun. Arbejdet fordeles således at hannen ruger om natten og hunnen ruger om dagen. Et strudseæg vejer omkring 1500 gram, som svarer til cirka 20 hønseæg."),
                    Spacer(),
                    Spacer(),
                    Text("Strudsen har også et meget godt syn og har det største øje af alle landlevende dyr."),
                }),
            new Content(
                new object(),
                "container",
                new List<Content>()
                {
                    new Content(new object(), "list", new List<Content>
                    {
                        Spacer(),
                        ListItem(
                            "Udbredelse: På åbne savanneområder i Øst- og Sydafrika. Der findes også vilde strudse i Australien, som nedstammer fra strudse, der har været holdt i fangenskab"),
                        Spacer(),
                        ListItem(
                            "Bestand: Strudsen var tidligere almindelig i store dele af Afrika. Den er i dag gået stærkt tilbage i antal, primært fordi den har været efterstræbt af mennesker. Strudsen er i dag truet."),
                        Spacer(),
                        ListItem("Vægt: Op til 135 kilo"),
                        Spacer(),
                        ListItem("Højde: Ca. 2,5 meter"),
                        Spacer(),
                        ListItem("Kropslængde: Op til 2,75 meter"),
                        Spacer(),
                        ListItem("Kønsmoden: Fra 3-4-årsalderen. Hunner kan blive kønsmodne allerede i 2-årsalderen"),
                        Spacer(),
                        ListItem("Rugeperiode: Cirka 42 dage"),
                        Spacer(),
                        ListItem(
                            "Antal æg: 8-10 æg pr. hun. I en strudserede kan der være helt op til 60 æg lagt af forskellige hunner. Hvert æg vejer cirka 1500 gram"),
                        Spacer(),
                        ListItem("Føde: Frø, græs, blade og blomster, insekter og øgler."),
                        Spacer(),
                        ListItem("Levealder: 20-30 år"),
                        Spacer()
                    })
                })
        };

        //Act
        var response = parseContent.ParseContent(content);


        //Assert
        response.IsSuccess(out var result).Should().BeTrue();
        result!.Should().BeEquivalentTo(expectedContent);
    }
}