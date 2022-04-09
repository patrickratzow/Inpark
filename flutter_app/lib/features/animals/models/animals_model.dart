import 'package:flutter_app/generated_code/zooinator.swagger.dart';

class AnimalsModel {
  late final List<Animal> animals;

  AnimalsModel(this.animals) {
    animals.sort((a, b) => a.name.displayName.compareTo(b.name.displayName));
  }
}
