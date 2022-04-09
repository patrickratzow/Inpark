import 'package:flutter_app/generated_code/zooinator.swagger.dart';

class AnimalsModel {
  late final List<Animal> _animals;

  AnimalsModel(this._animals) {
    _animals.sort((a, b) => a.name.displayName.compareTo(b.name.displayName));
  }

  List<Animal> get animals => _animals;
}
