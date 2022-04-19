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

      return Result.success(
        response.body!.map((e) {
          var newStatus = e.status.index + 1;
          var animal = e.copyWith(status: IUCNStatusDto.values[newStatus]);

          return animal;
        }).toList(),
      );
    } catch (ex) {
      return Result.error(ex.toString());
    }
  }
}
