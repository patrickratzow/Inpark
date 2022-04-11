import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/ioc.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';

import '../repositories/animals_repository.dart';

class AnimalsModel extends ChangeNotifier {
  List<Animal> _animals = List.empty();
  String _search = '';
  String error = "";
  bool loading = false;
  bool get hasError => error.isNotEmpty;

  AnimalsModel();
  AnimalsModel.withAnimals(this._animals);

  String get search => _search;
  set search(String value) {
    _search = value;

    notifyListeners();
  }

  Future<void> fetchAnimals() async {
    final animalsRepository = locator.get<AnimalsRepository>();

    try {
      loading = true;

      var animalsResult = await animalsRepository.fetchAnimals();
      if (animalsResult.isSuccess) {
        _animals = animalsResult.success!.animals;
        _animals
            .sort((a, b) => a.name.displayName.compareTo(b.name.displayName));
      } else {
        error = animalsResult.error.toString();
      }
    } finally {
      loading = false;

      notifyListeners();
    }
  }

  List<Animal> get animals {
    var animals = _animals;
    if (search.isNotEmpty) {
      animals = animals
          .where((animal) => animal.name.displayName
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList();
    }

    return animals;
  }
}
