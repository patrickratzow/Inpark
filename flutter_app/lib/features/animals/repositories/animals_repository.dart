import "../../../common/ioc.dart";
import "../../../common/result.dart";
import "../../../generated_code/zooinator.swagger.dart";

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

      return Result.success(_animals ??= response.body);
    } catch (ex) {
      return Result.error(ex.toString());
    }
  }
}
