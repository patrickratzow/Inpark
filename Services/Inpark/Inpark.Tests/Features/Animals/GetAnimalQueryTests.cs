using System.Threading.Tasks;
using DomainFixture;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Errors;
using Zoo.Inpark.Features.Animals;

namespace Zoo.Inpark.Tests.Features.Animals;

[TestFixture]
[Category(Categories.Integration)]
public class GetAnimalQueryTests : TestBase
{
    [Test]
    public async Task Handle_ShouldReturnAnimal_WhenAnAnimalExists()
    {
        // Arrange
        var animal = await Add(Fixture.Valid<Animal>().Create());
        var query = new GetAnimalQuery(animal.Name.LatinName);
        
        // Act
        var response = await Send(query);

        // Assert
        response.Value.Should().BeOfType<Animal>();
        var result = response.Value.As<Animal>();
        result.Id.Should().Be(animal.Id);
    }
    
    [Test]
    public async Task Handle_ShouldReturnAnimalNotFound_WhenAnAnimalDoesNotExist()
    {
        // Arrange
        var query = new GetAnimalQuery("floppa");
        
        // Act
        var response = await Send(query);

        // Assert
        response.Value.Should().BeOfType<AnimalNotFound>();
    }
}