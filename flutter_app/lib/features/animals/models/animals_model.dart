import "package:flutter/cupertino.dart";
import "package:flutter_app/common/ioc.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";

import "../repositories/animals_repository.dart";

class AnimalsModel extends ChangeNotifier {
  List<AnimalDto> _animals = List.empty();
  String _search = "";
  String error = "";
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
        _animals.sort(
            (a, b) => a.nameDto.displayName.compareTo(b.nameDto.displayName));
      } else {
        error = animalsResult.error.toString();
      }
    } finally {
      loading = false;

      notifyListeners();
    }
  }

  List<AnimalDto> get animals {
    var animals = _animals;
    if (search.isNotEmpty) {
      animals = animals
          .where(
            (animal) => animal.nameDto.displayName
                .toLowerCase()
                .contains(search.toLowerCase()),
          )
          .toList();
    }

    return animals;
  }
}
