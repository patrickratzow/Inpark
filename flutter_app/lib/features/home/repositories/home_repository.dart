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

      var openingHours = response.body!.map((openingHour) {
        return openingHour.copyWith(
          start: openingHour.start,
          end: openingHour.end,
        );
      }).toList();
      return Result.success(openingHours);
    } catch (ex) {
      return Result.error(ex.toString());
    }
  }
}
