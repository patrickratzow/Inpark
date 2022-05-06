import "package:flutter_app/common/ioc.dart";
import "package:flutter_app/common/result.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";

class ParkEventRepository {
  late final Zooinator _apiClient;

  ParkEventRepository() {
    _apiClient = locator.get<Zooinator>();
  }

  Future<Result<List<ParkEventDto>, String>> fetchParkEvents() async {
    try {
      var response = await _apiClient.getParkEvents();

      if (!response.isSuccessful) {
        return Result.error(response.error.toString());
      }

      return Result.success(response.body!);
    } catch (ex) {
      return Result.error(ex.toString());
    }
  }
}
