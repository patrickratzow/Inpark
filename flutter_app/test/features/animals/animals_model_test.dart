import "package:flutter_app/features/animals/models/animal.dart";
import "package:flutter_app/features/animals/models/animals_model.dart";
import "package:flutter_app/features/animals/models/iucn_status.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  late List<Animal> animals;

  setUp(() {
    animals = [
      Animal(
        id: "5",
        displayName: "Floppa",
        latinName: "Big floppa",
        category: "Pattedyr",
        fullscreenImageUrl: "",
        previewImageUrl: "",
        conservationStatus: ucnStatusColorMap[IUCNStatusDto.cr],
        description: "",
      ),
      Animal(
        id: "5",
        displayName: "Bingus",
        latinName: "BB",
        category: "Pattedyr",
        fullscreenImageUrl: "",
        previewImageUrl: "",
        conservationStatus: ucnStatusColorMap[IUCNStatusDto.en],
        description: "",
      ),
      Animal(
        id: "5",
        displayName: "Snek",
        latinName: "Snaike",
        category: "Krybdyr",
        fullscreenImageUrl: "",
        previewImageUrl: "",
        conservationStatus: ucnStatusColorMap[IUCNStatusDto.cr],
        description: "",
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
      expect(result.first.displayName, "Floppa");
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
      expect(result.first.displayName, "Floppa");
    },
  );

  test(
    "animals returns animals with category matching enabled category",
    () {
      // Arrange
      AnimalsModel model = AnimalsModel.withAnimals(animals);
      AnimalCategory category =
          model.categories.firstWhere((x) => x.name == "Pattedyr");

      // Act
      model.toggleCategory(category, null);
      var result = model.animals;

      // Assert
      expect(result.length, 1);
      expect(result.first.displayName, "Snek");
    },
  );

  test(
    "animals returns no animals when all categories are disabled",
    () {
      // Arrange
      AnimalsModel model = AnimalsModel.withAnimals(animals);
      AnimalCategory category =
          model.categories.firstWhere((x) => x.name == "Pattedyr");
      AnimalCategory categoryTwo =
          model.categories.firstWhere((x) => x.name == "Krybdyr");

      // Act
      model.toggleCategory(category, null);
      model.toggleCategory(categoryTwo, null);
      var result = model.animals;

      // Assert
      expect(result.length, 0);
    },
  );
}
