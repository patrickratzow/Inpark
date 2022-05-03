import "package:flutter/cupertino.dart";
import "package:flutter_app/common/ioc.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";

import "../repositories/animals_repository.dart";

class AnimalsModel extends ChangeNotifier {
  List<AnimalDto> _animals = List.empty();
  String _search = "";
  String error = "";
  Set<AnimalCategory> _animalCategories = {};
  bool isSearching = false;

  bool loading = false;
  bool get hasError => error.isNotEmpty;

  AnimalsModel();
  AnimalsModel.withAnimals(this._animals);

  String get search => _search;
  set search(String value) {
    _search = value;

    notifyListeners();
  }

  void startSearching() {
    _search = "";
    isSearching = true;

    notifyListeners();
  }

  void stopSearching() {
    _search = "";
    isSearching = false;

    notifyListeners();
  }

  Future<void> fetchAnimals() async {
    final animalsRepository = locator.get<AnimalsRepository>();

    try {
      loading = true;

      var animalsResult = await animalsRepository.fetchAnimals();
      if (animalsResult.isSuccess) {
        _animals = animalsResult.success as List<AnimalDto>;
        _animalCategories = _animals
            .map((animal) => animal.category)
            .toSet()
            .map((category) => AnimalCategory(category))
            .toSet();
      } else {
        error = animalsResult.error.toString();
      }
    } finally {
      loading = false;

      notifyListeners();
    }
  }

  List<AnimalDto> get animals {
    Iterable<AnimalDto> animals = _animals;

    var enabledCategories = _animalCategories
        .where((animalCategory) => animalCategory.enabled)
        .map((animalCategory) => animalCategory.name)
        .toSet();

    animals = animals.where(
      (animal) => enabledCategories.contains(animal.category),
    );

    if (search.isNotEmpty) {
      animals = animals.where(
        (animal) => animal.name.displayName
            .toLowerCase()
            .contains(search.toLowerCase()),
      );
    }

    return animals.toList();
  }

  void toggleCategory(AnimalCategory animalCategory) {
    animalCategory.enabled = !animalCategory.enabled;

    notifyListeners();
  }

  Set<AnimalCategory> get categories {
    return _animalCategories;
  }

  void getAnimalsByCategory() {}
}

class AnimalCategory {
  final String name;
  bool enabled = true;

  AnimalCategory(this.name);
}
