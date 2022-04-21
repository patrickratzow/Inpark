import "package:flutter_app/common/ioc.dart";
import "package:flutter_app/common/result.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";

class HomeRepository {
  late final Zooinator _apiClient;

  HomeRepository() {
    _apiClient = locator.get<Zooinator>();
  }

  Future<Result<List<OpeningHourDto>, String>>
      fetchOpeningHoursForToday() async {
    try {
      var response = await _apiClient.getOpeningHoursForToday();

      if (!response.isSuccessful) {
        return Result.error(response.error.toString());
      }

      // Map all times to local time for ease of use outside this
      var openingHours = response.body!.map((openingHour) {
        return openingHour.copyWith(
          start: openingHour.start.toLocal(),
          end: openingHour.end.toLocal(),
        );
      }).toList();
      return Result.success(openingHours);
    } catch (ex) {
      return Result.error(ex.toString());
    }
  }

  Future<Result<List<SpeakDto>, String>> fetchSpeaksForToday() async {
    try {
      var response = await _apiClient.getSpeaksForToday();

      if (!response.isSuccessful) {
        return Result.error(response.error.toString());
      }

      // Map all times to local time for ease of use outside this
      var speaks = response.body!.map((speak) {
        return speak.copyWith(
          title: speak.title,
          start: speak.start.toLocal(),
          days: speak.days,
        );
      }).toList();
      return Result.success(speaks);
    } catch (ex) {
      return Result.error(ex.toString());
    }
  }
}
