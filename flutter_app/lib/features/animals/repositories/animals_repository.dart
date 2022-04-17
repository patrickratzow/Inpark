import "package:flutter_app/common/ioc.dart";
import "package:flutter_app/common/result.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";

class AnimalsRepository {
  late final Zooinator _apiClient;

  AnimalsRepository() {
    _apiClient = locator.get<Zooinator>();
  }

  Future<Result<List<AnimalDto>, String>> fetchAnimals() async {
    try {
      var response = await _apiClient.getAnimals();

      if (!response.isSuccessful) {
        return Result.error(response.error.toString());
      }

      return Result.success(response.body!);
    } catch (ex) {
      return Result.error(ex.toString());
    }
  }
}
