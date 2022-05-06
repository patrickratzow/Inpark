using Microsoft.Extensions.Logging;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zoo.Inpark.Features.Events.AalborgZoo;
using Zoo.Inpark.Models;
using Zoo.Inpark.Services;

namespace Zoo.Inpark.Tests.Features.ParkEvents;

public class AalborgZooParkEventMapperTests : TestBase
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
        return new Content("", "listitem", new List<Content>
        {
            Text(text)
        });
    }
    private Content Header(string text)
    {
        return new Content(text, "header", Array.Empty<Content>());
    }
    private Content Strong(string text)
    {
        return new Content("", "strong", new List<Content>
        {
            Text(text)
        });
    }

    [Test]
    public void ParseContent_ShouldReturnExpectedOutput_WhenGivenInput()
    {
        //Arrange
        var htmlTransformer = GetRequiredService<IHtmlTransformer>();
        var logger = new Mock<ILogger<AalborgZooParkEventMapper>>();

        var parseContent = new AalborgZooParkEventMapper(htmlTransformer, logger.Object);
        var content =
            "[[{\"header\":\"13. maj - 15. maj\",\"headerType\":\"H2\",\"type\":\"header\"},{\"text\":\"<p>I Store Bededagsferien kan du komme bag kulisserne i Aalborgs allervildeste skole; Skoletjenesten i Aalborg Zoo. Skolen bliver hvert år besøgt af knap 10.000 nysgerrige og dyreglade elever, og vi garanterer, at du får en meget anderledes skoleoplevelse.</p>\\n<p>I Skoletjenesten kommer du helt tæt på alverdens dyreeffekter, slanger og små krybdyr, og du kan tage en snak med vores dygtige undervisere.</p>\",\"type\":\"text\"}],[{\"header\":\"Program\",\"headerType\":\"H2\",\"type\":\"header\"},{\"text\":\"<p><strong>Kl. 11.00-16.00:</strong></p>\\n<ul>\\n<li>Skoletjenesten er åben.</li>\\n</ul>\\n<p><strong>Kl. 11.00, 12.00 &amp; 13.00:</strong></p>\\n<ul>\\n<li>Kom med på undervisningsoplægget 'Hverdagen i Zoo'. Oplægget består af en lille rundtur til udvalgte steder i Zoo og tager ca. 30 min. Oplægget henvender sig mest til børn fra 6-12 år, men alle børn og voksne er velkomne. Oplægget starter foran Skoletjenesten på de tre givne tidspunkter.</li>\\n</ul>\",\"type\":\"text\"}]]";

        var expectedContent = new List<IContent>
        {
            Header("13. maj - 15. maj"),
            new Content(new object(),
                "container",
                new List<Content>()
                {
                    Text(
                        "I Store Bededagsferien kan du komme bag kulisserne i Aalborgs allervildeste skole; Skoletjenesten i Aalborg Zoo. Skolen bliver hvert år besøgt af knap 10.000 nysgerrige og dyreglade elever, og vi garanterer, at du får en meget anderledes skoleoplevelse."),
                    Spacer(),
                    Text(
                        "I Skoletjenesten kommer du helt tæt på alverdens dyreeffekter, slanger og små krybdyr, og du kan tage en snak med vores dygtige undervisere."),

                }),
             Header("Program"),
            new Content(new object(),
            "container",
            new List<Content>()
            {
                new Content("",
                "strong",
                new List<Content>()
                {
                    Text("Kl. 11.00-16.00:"),
                }),
                Spacer(),
                new Content(new object(), "list", new List<Content>
                {
                    Spacer(),
                    ListItem(
                        "Skoletjenesten er åben."),
                    Spacer(),
                }),
                Spacer(),
                 new Content("",
                "strong",
                new List<Content>()
                {
                    Text("Kl. 11.00, 12.00 & 13.00:"),
                }),
                Spacer(),
                new Content(new object(), "list", new List<Content>
                {
                    Spacer(),
                    ListItem(
                        "Kom med på undervisningsoplægget 'Hverdagen i Zoo'. Oplægget består af en lille rundtur til udvalgte steder i Zoo og tager ca. 30 min. Oplægget henvender sig mest til børn fra 6-12 år, men alle børn og voksne er velkomne. Oplægget starter foran Skoletjenesten på de tre givne tidspunkter."),
                    Spacer(),
                }),
            }),

        };

        //Act
        var response = parseContent.ParseContent(content);


        //Assert
        response.IsSuccess(out var result).Should().BeTrue();
        result!.Should().BeEquivalentTo(expectedContent);
    }

}

