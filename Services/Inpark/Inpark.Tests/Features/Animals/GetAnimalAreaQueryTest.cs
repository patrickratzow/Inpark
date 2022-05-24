using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DomainFixture;
using Zoo.Inpark.Contracts;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Features.Animals;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Tests.Features.Animals;

[TestFixture]
[Category(Categories.Integration)]
public class GetAnimalAreaQueryTest : TestBase
{
    [Test]
    public async Task Handle_ShouldReturnAreaWithPoints_WhenAnimalHaveAnArea()
    {
        // Arrange
        var pointList = new List<Point>()
        {
            CreatePoint(44.5,44.55),
            CreatePoint(34.5,64.55),
        };
        var animalArea = new List<AnimalArea>()
        {
            CreateAnimalArea(pointList)
        };
        var animal = await Add(CreateAnimal(animalArea));
        
        var query = new GetAnimalAreaQuery(animal.Name.LatinName);

        // Act
        var response = await Send(query);

        // Assert
        response.Value.Should().BeOfType<List<AnimalAreaDto>>();
        var result = response.Value.As<List<AnimalAreaDto>>();
        result.Should().HaveCount(1);
        var resultArea = result.First();
        var pointListArray = pointList
            .Select(p => new double[]{p.X, p.Y})
            .SelectMany(p => p); 
        resultArea.Points.Should().IntersectWith(pointListArray);
    }
    
    [Test]
    public async Task Handle_ShouldReturnAreasWithPoints_WhenAnimalHaveMoreThanOneArea()
    {
        // Arrange
        // Act
        // Assert
    }
    
    [Test]
    public async Task Handle_ShouldEmptyList_WhenAnimalHaveNoAreas()
    {
        // Arrange
        // Act
        // Assert
    }

    private static Point CreatePoint(double x, double y)
    {
        return Fixture.Valid<Point>()
            .With(p => p.X, x)
            .With(p => p.Y, y)
            .Create();
    }

    private static AnimalArea CreateAnimalArea(List<Point> point)
    {
        return Fixture.Valid<AnimalArea>()
            .With(a => a.Points, point)
            .Create();
    }

    private static Animal CreateAnimal(List<AnimalArea> animalAreas)
    {
        return Fixture.Valid<Animal>()
            .With(a => a.Areas, animalAreas)
            .Create();
    }
}