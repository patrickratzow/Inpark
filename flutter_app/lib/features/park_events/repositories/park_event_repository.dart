import "package:flutter_app/common/ioc.dart";
import "package:flutter_app/common/result.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";

class ParkEventRepository {
  List<ParkEventDto>? _events;

  Future<Result<List<ParkEventDto>, String>> fetchParkEvents() async {
    if (_events != null) return Result.success(_events!);

    var apiClient = locator.get<Zooinator>();

    try {
      var response = await apiClient.getParkEvents();

      if (!response.isSuccessful) {
        return Result.error(response.error.toString());
      }

      return Result.success(_events ??= response.body!);
    } catch (ex) {
      return Result.error(ex.toString());
    }
  }
}
