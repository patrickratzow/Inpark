import 'package:flutter_app/common/ioc.dart';
import 'package:flutter_app/common/result.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';

class AnimalsRepository {
  late final Zooinator _apiClient;
  AnimalOverview? _animalOverview;

  AnimalsRepository() {
    _apiClient = locator.get<Zooinator>();
    _animalOverview = null;
  }

  Future<Result<AnimalOverview, String>> fetchAnimals() async {
    if (_animalOverview != null) {
      return Result.success(_animalOverview!);
    }

    var response = await _apiClient.getAnimalOverview();

    if (!response.isSuccessful) {
      return Result.error(response.error.toString());
    }

    _animalOverview = response.body;
    return Result.success(response.body!);
  }
}
