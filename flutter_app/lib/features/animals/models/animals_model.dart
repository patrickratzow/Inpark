import "package:flutter/material.dart";
import "package:flutter_app/features/animals/models/animal_area.dart";
import "../../../common/ioc.dart";

import "../repositories/animals_repository.dart";
import "animal.dart";

class AnimalsModel extends ChangeNotifier {
  List<Animal> _animals = List.empty();
  Map<String, List<AnimalArea>> _animalAreas = {};
  String _search = "";
  String error = "";
  Set<AnimalCategory> _animalCategories = {};
  Set<AnimalCategory> get categories => _animalCategories;
  bool isSearching = false;

  bool loading = false;
  bool get hasError => error.isNotEmpty;

  AnimalsModel();
  AnimalsModel.withAnimals(this._animals) {
    _animalCategories =
        _animals.map((animal) => AnimalCategory(animal.category)).toSet();
  }

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

      _animals = await animalsRepository.fetchAnimals();
      _animalCategories =
          _animals.map((animal) => AnimalCategory(animal.category)).toSet();
    } catch (ex) {
      error = ex.toString();
    } finally {
      loading = false;

      notifyListeners();
    }
  }

  Future fetchAnimalAreas(String latinName) async {
    final animalsRepository = locator.get<AnimalsRepository>();

    try {
      loading = true;

      var animalAreasResult = await animalsRepository.getAnimalArea(latinName);
      _animalAreas[latinName] = animalAreasResult;
    } catch (ex) {
      error = ex.toString();
    } finally {
      loading = false;

      notifyListeners();
    }
  }

  List<AnimalArea>? getAnimalAreas(String latinName) => _animalAreas[latinName];

  List<Animal> get animals {
    Iterable<Animal> animals = _animals;

    var enabledCategories = _animalCategories
        .where((animalCategory) => animalCategory.enabled)
        .map((animalCategory) => animalCategory.name)
        .toSet();

    animals = animals.where(
      (animal) => enabledCategories.contains(animal.category),
    );

    if (search.isNotEmpty) {
      animals = animals.where(
        (animal) =>
            animal.displayName.toLowerCase().contains(search.toLowerCase()),
      );
    }

    return animals.toList();
  }

  void toggleCategory(AnimalCategory animalCategory, BuildContext? context) {
    final disabled =
        _animalCategories.where((animalCategory) => !animalCategory.enabled);
    final isDisablingLastEnabledCategory =
        disabled.length == _animalCategories.length - 1 &&
            animalCategory.enabled;
    if (isDisablingLastEnabledCategory && context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2, milliseconds: 500),
          content: Text("Mindst 1 kategori skal være slået til"),
        ),
      );

      return;
    }

    animalCategory.enabled = !animalCategory.enabled;

    notifyListeners();
  }
}

class AnimalCategory {
  final String name;
  bool enabled = true;

  AnimalCategory(this.name);

  @override
  operator ==(other) => other is AnimalCategory && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
