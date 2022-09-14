using Microsoft.Extensions.Logging;
using Moq;

namespace Zeta.UI.Intermediate.Tests;

[TestFixture]
[Category(Categories.Unit)]
public class CompilerTests
{
    private Compiler _compiler = null!;
    
    [SetUp]
    public void SetUp()
    {
        var logger = new Mock<ILogger<Compiler>>();
        _compiler = new(logger.Object);
    }

    [Test]
    public async Task Compile_Should_Compile()
    {
        // Arrange
        var input = """ 
        [
            {
                "layout": {
                    "column": "grid-12"
                },
                "type": "layout",
                "content": [
                    [
                        {
                            "text": "Afrikansk dværgged",
                            "type": "headline"
                        }
                    ]
                ]
            },
            {
                "layout": {
                    "column": "grid-6-6"
                },
                "type": "layout",
                "content": [
                    [
                        {
                            "text": "<p>Dværggeden stammer fra bezoargeden, som er forfader til mere end 400 forskellige gederacer. Af disse er afrikansk dværgged den mindste.<br /><br />Bezoargeden blev tæmmet og gjort til husdyr i Mellemøsten og Tyrkiet for 8-9000 år siden. <br />Bestande af vilde bezoargeder lever dog stadig i Iran, Afghanistan, Pakistan og Tyrkiet.<br />Geden bliver også kaldt ”den fattige mands ko”, fordi den er meget nøjsom og lever af energifattig føde.<br /><br />Mælken, kødet og skindet har gjort den til et populært husdyr i flere lande.</p>",
                            "type": "text"
                        }
                    ],
                    [
                        {
                            "text": "<ul>\n<li>Udbredelse: Er især udbredt i Mellemøsten og Afrika, men findes som husdyr i hele verden.</li>\n<li>Bestand: Ikke truet</li>\n<li>Vægt: Hanner: 30-35 kilo. Hunner: 20-25 kilo</li>\n<li>Højde: Cirka 64 centimeter</li>\n<li>Parringstid: Fra sensommer til tidlig vinter. I varmere områder, hvor dagene er længere, kan den parre hele året rundt</li>\n<li>Kønsmoden: Hanner fra seks måneder. Hunner fra 1 år</li>\n<li>Drægtighed: 150-160 dage</li>\n<li>Antal unger: 1-4 kid</li>\n<li>Føde: Altædende, men især græs, busk- og urtevegetation</li>\n<li>Zoo-menu: Kraftfoder, friske grene, hø og grønt</li>\n<li>Levealder: 10-15 år</li>\n</ul>",
                            "type": "text"
                        }
                    ]
                ]
            },
            {
                "layout": {
                    "column": "grid-12"
                },
                "type": "layout",
                "content": [
                    []
                ]
            },
            {
                "layout": {
                    "column": "grid-6-6"
                },
                "type": "layout",
                "content": [
                    [
                        {
                            "header": "Læs videre og lær vores geder endnu bedre at kende",
                            "headerType": "H2",
                            "type": "header"
                        },
                        {
                            "text": "<p><strong>Aalborg Zoos geder – en oplevelse for alle sanser</strong></p>\n<p>De fleste forbinder nok zoologisk have med eksotiske, truede og måske farlige dyr, som man kan se, men ikke røre. Men i Aalborg Zoo er der også dyr, der er langt mere tilnærmelige end løver, tigre og store krokodiller, og de er et vigtigt bidrag til at gøre et besøg i Zoo til en oplevelse for alle sanser. Gederne får typisk kid to gange om året, som regel i januar og igen om sommeren seks måneder senere. De afrikanske dværggeder er populære dyr i Zoo, og langt de fleste gæster skal lige hen at sige hej og give et klap eller et nus til de selskabelige dyr</p>",
                            "type": "text"
                        },
                        {
                            "text": "<p><strong>Det begynder med gederne</strong></p>\n<p>Det kan godt være at vores geder bliver omtalt som ”klappegeder”, men gedernes rolle i Zoo rækker langt videre end til at være nuttede og hyggelige. De har en vigtig funktion i forhold til Zoos formål, da de er med til at skabe bånd og vække interesse og forståelse for dyrene. Hos gederne kan selv de helt små børn nemlig få en stor oplevelse med dyrene, og fordi man kommer så tæt på dem, bliver det også en sanselig oplevelse. Man kan røre og føle, man kan lugte, og man kan i den grad høre dem, ikke mindst når der er fodringstid, og de godmodige geder har ikke noget imod, at de mindste børn kommer tæt på og tager lidt fat i pelsen eller i et horn. Gederne er født og opvokset her, så de er vant til at omgås børn og mange mennesker i det hele taget.</p>",
                            "type": "text"
                        }
                    ],
                    [
                        {
                            "image": "/media/smknzl34/boerged700x350.jpg",
                            "width": 700,
                            "alt": "",
                            "type": "image",
                            "height": 350
                        },
                        {
                            "text": "<p><strong>Respekt for dyrenes behov</strong></p>\n<p>Tidligere var det tilladt for gæster i Zoo at fodre gederne, og det kunne godt skabe lidt tumult og kamp om de bedste bidder, men nu er fodring forbeholdt dyrepasserne i Zoo, så de kan sikre, at gederne får det rigtige foder og den nødvendige ernæring. Gederne har desuden områder både inde og ude, hvor det er muligt for dem at trække sig tilbage, hvis de har brug for en pause fra kontakten med gæsterne. På den måde er de også med til at lære børnene at have respekt for dyrenes behov og ønsker.</p>\n<p>Et besøg hos gederne er desuden også en god anledning til at fortælle om Zoos drift og lære børnene om forholdet mellem rovdyr og byttedyr. Der bliver født mange geder i Zoo, og en del af dem ender som foder hos rovdyrene, og netop dette er en vigtig del at få fortalt om, ikke mindst til børnene. Det kan give nogle rigtig gode snakke både i gedegården og i rovdyrhuset, hvor man kan opleve at se gederne i rovdyrenes foderspande, og heldigvis er der en generelt god forståelse for det i Danmark, mens man i mange andre lande er langt mere berøringsangst for, hvordan naturen er indrettet.</p>",
                            "type": "text"
                        },
                        {
                            "text": "<p><strong>Nye opgaver</strong></p>\n<p>Et par af de voksne geder kan se frem til at få endnu en opgave på CV’et. De træner nemlig til at optræde på Zoofariscenen, hvor de skal spille rollen som Bezoargeder. I formidlingsforestillingen ”Rejsen” kommer publikum med Zoos dyrepassere ud i verden og hører om nogle af de dyrearter, som af forskellige årsager kæmper for at overleve. Bezoar-geden, der lever i Kaukasus, er truet på grund af jagt og lever nu i fredede områder.</p>",
                            "type": "text"
                        }
                    ]
                ]
            }
        ]
        """;
        var json = JsonDocument.Parse(input);

        // Act
        var result =  await _compiler.Compile(json);

        // Assert
        result.Should().NotBeNull();
    }
}