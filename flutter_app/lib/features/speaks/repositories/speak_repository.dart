import "package:flutter_app/generated_code/client_index.dart";

import "../../../common/ioc.dart";
import "../../../common/result.dart";
import "../../../generated_code/zooinator.models.swagger.dart";

class SpeakRepository {
  late final Zooinator _apiClient;

  SpeakRepository() {
    _apiClient = locator.get<Zooinator>();
  }

  Future<Result<List<SpeakDto>, String>> fetchSpeaksForToday() async {
    try {
      var response = await _apiClient.getSpeaksForToday();

      if (!response.isSuccessful) {
        return Result.error(response.error.toString());
      }

      var speaks = response.body!.map((speak) {
        return speak.copyWith(
          title: speak.title,
          start: speak.start,
          days: speak.days,
        );
      }).toList();
      return Result.success(speaks);
    } catch (ex) {
      return Result.error(ex.toString());
    }
  }
}
