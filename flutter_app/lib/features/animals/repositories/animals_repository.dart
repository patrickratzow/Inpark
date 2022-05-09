import "package:flutter_app/common/ioc.dart";
import "package:flutter_app/common/result.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";

class AnimalsRepository {
  List<AnimalDto>? _animals;

  Future<Result<List<AnimalDto>, String>> fetchAnimals() async {
    if (_animals != null) return Result.success(_animals);

    try {
      var apiClient = locator.get<Zooinator>();
      var response = await apiClient.getAnimals();

      if (!response.isSuccessful) {
        return Result.error(response.error.toString());
      }
      _animals = response.body;

      return Result.success(_animals);
    } catch (ex) {
      return Result.error(ex.toString());
    }
  }
}
