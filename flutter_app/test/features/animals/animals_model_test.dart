import "package:flutter_app/features/animals/models/animals_model.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  late List<AnimalDto> animals;

  setUp(() {
    animals = [
      AnimalDto(
        name: AnimalNameDto(displayName: "Floppa", latinName: "Big floppa"),
        category: "Pattedyr",
        image: AnimalImageDto(fullscreenUrl: "", previewUrl: ""),
        id: "5",
        status: IUCNStatusDto.cr,
        contents: List.empty(),
      ),
      AnimalDto(
        name: AnimalNameDto(displayName: "Bingus", latinName: "BB"),
        category: "Pattedyr",
        image: AnimalImageDto(fullscreenUrl: "", previewUrl: ""),
        id: "5",
        status: IUCNStatusDto.en,
        contents: List.empty(),
      ),
      AnimalDto(
        name: AnimalNameDto(displayName: "Snek", latinName: "Snaike"),
        category: "Krybdyr",
        image: AnimalImageDto(fullscreenUrl: "", previewUrl: ""),
        id: "5",
        status: IUCNStatusDto.en,
        contents: List.empty(),
      )
    ];
  });

  test(
    "animals returns backing field",
    () {
      // Arrange
      AnimalsModel model = AnimalsModel.withAnimals(animals);

      // Act
      var result = model.animals;

      // Assert
      expect(result.length, animals.length);
      expect(result.first, animals.first);
      expect(result.last, animals.last);
    },
  );

  test(
    "animals returns animals that matches search string",
    () {
      // Arrange
      AnimalsModel model = AnimalsModel.withAnimals(animals);

      // Act
      model.search = "Fl";
      var result = model.animals;

      // Assert
      expect(result.length, 1);
      expect(result.first.name.displayName, "Floppa");
    },
  );

  test(
    "animals search is case insensitive",
    () {
      // Arrange
      AnimalsModel model = AnimalsModel.withAnimals(animals);

      // Act
      model.search = "fl";
      var result = model.animals;

      // Assert
      expect(result.length, 1);
      expect(result.first.name.displayName, "Floppa");
    },
  );

  test(
    "animals returns animals with category matching enabled category",
    () {
      //Arrange
      AnimalsModel model = AnimalsModel.withAnimals(animals);
      AnimalCategory category =
          model.categories.firstWhere((x) => x.name == "Pattedyr");

      //Act
      model.toggleCategory(category);
      var result = model.animals;

      //Assert
      expect(result.length, 1);
      expect(result.first.name.displayName, "Snek");
    },
  );

  test(
    "animals returns no animals when all categories are disabled",
    () {
      //Arrange
      AnimalsModel model = AnimalsModel.withAnimals(animals);
      AnimalCategory category =
          model.categories.firstWhere((x) => x.name == "Pattedyr");
      AnimalCategory categoryTwo =
          model.categories.firstWhere((x) => x.name == "Krybdyr");

      //Act
      model.toggleCategory(category);
      model.toggleCategory(categoryTwo);
      var result = model.animals;

      //Assert
      expect(result.length, 0);
    },
  );
}
