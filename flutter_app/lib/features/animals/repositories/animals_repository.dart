import 'package:flutter_app/common/ioc.dart';
import 'package:flutter_app/common/result.dart';
import 'package:flutter_app/generated_code/client_index.dart';

import '../models/animals_model.dart';

class AnimalsRepository {
  Future<Result<AnimalsModel, String>> fetchAnimals() async {
    var apiClient = locator.get<Zooinator>();

    var response = await apiClient.getAnimalOverview();
    if (!response.isSuccessful) {
      return Result.error(response.error.toString());
    }

    return Result.success(
      AnimalsModel(response.body!.animals),
    );
  }
}
