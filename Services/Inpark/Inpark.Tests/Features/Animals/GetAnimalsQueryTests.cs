using System.Collections.Generic;
using System.Threading.Tasks;
using DomainFixture;
using Zeta.Inpark.Entities;
using Zeta.Inpark.Features.Animals;
using Zeta.Inpark.ValueObjects;
using Zoo.Inpark.Contracts;

namespace Zoo.Inpark.Tests.Features.Animals;

[TestFixture]
[Category(Categories.Integration)]
public class GetAnimalsQueryTests : TestBase
{
    [Test]
    public async Task Handle_ShouldFindAllAnimalsInDatabase()
    {
        // Arrange
        await AddRange(Fixture.Valid<Animal>().CreateMany(5));
        var query = new GetAnimalsQuery();

        // Act
        var response = await Send(query);

        // Assert
        response.Value.Should().BeOfType<List<AnimalDto>>();
        var result = response.Value.As<List<AnimalDto>>();
        result.Should().HaveCount(5);
    }
    
    [Test]
    public async Task Handle_ShouldSortAnimals_ByName()
    {
        // Arrange
        var firstAnimal = await Add(
            Fixture.Valid<Animal>()
                .With(x => x.Name, AnimalName.From("n", "df"))
                .Create()
        );
        var secondAnimal = await Add(
            Fixture.Valid<Animal>()
                .With(x => x.Name, AnimalName.From("a", "df"))
                .Create()
        );
        
        var query = new GetAnimalsQuery();

        // Act
        var response = await Send(query);

        // Assert
        response.Value.Should().BeOfType<List<AnimalDto>>();
        var result = response.Value.As<List<AnimalDto>>();
        result.Should().HaveCount(2)
            .And.SatisfyRespectively(first =>
            {
                first.Name.DisplayName.Should().Be(secondAnimal.Name.Name);
            }, 
            second =>
            {
                second.Name.DisplayName.Should().Be(firstAnimal.Name.Name);
            });
    }
}