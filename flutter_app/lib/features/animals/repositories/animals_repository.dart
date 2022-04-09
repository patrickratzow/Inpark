import 'package:flutter_app/common/ioc.dart';
import 'package:flutter_app/common/result.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';

import '../models/animals_model.dart';

class AnimalsRepository {
  late final Zooinator _apiClient;

  AnimalsRepository() {
    _apiClient = locator.get<Zooinator>();
  }

  Future<Result<AnimalsModel, String>> fetchAnimals() async {
    var response = await _apiClient.getAnimalOverview();

    if (!response.isSuccessful) {
      return Result.error(response.error.toString());
    }

    return Result.success(AnimalsModel(response.body!.animals));
  }
}
