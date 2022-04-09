import 'package:flutter_app/generated_code/zooinator.swagger.dart';

class AnimalsModel {
  late final List<Animal> _animals;
  late String search = '';

  AnimalsModel(this._animals) {
    _animals.sort((a, b) => a.name.displayName.compareTo(b.name.displayName));
    search = '';
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
