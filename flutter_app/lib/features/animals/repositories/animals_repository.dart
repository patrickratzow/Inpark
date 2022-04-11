import 'package:flutter_app/common/ioc.dart';
import 'package:flutter_app/common/result.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';

import '../models/animals_model.dart';

class AnimalsRepository {
  late final Zooinator _apiClient;
  AnimalOverview? _animalOverview;

  AnimalsRepository() {
    _apiClient = locator.get<Zooinator>();
    _animalOverview = null;
  }

  Future<Result<AnimalsModel, String>> fetchAnimals() async {
    if (_animalOverview != null) {
      return Result.success(AnimalsModel(_animalOverview!.animals));
    }
    var response = await _apiClient.getAnimalOverview();

    if (!response.isSuccessful) {
      return Result.error(response.error.toString());
    }

    _animalOverview = response.body;
    return Result.success(AnimalsModel(response.body!.animals));
  }
}
