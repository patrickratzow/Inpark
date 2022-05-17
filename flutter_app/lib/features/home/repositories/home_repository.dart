import "../../../common/ioc.dart";
import "../../../common/result.dart";
import "../../../generated_code/zooinator.swagger.dart";

class HomeRepository {
  List<OpeningHourDto>? _openingHours;

  Future<Result<List<OpeningHourDto>, String>>
      fetchOpeningHoursForToday() async {
    if (_openingHours != null) return Result.success(_openingHours!);

    try {
      var apiClient = locator.get<Zooinator>();
      var response = await apiClient.getOpeningHoursForToday();

      if (!response.isSuccessful) {
        return Result.error(response.error.toString());
      }

      var openingHours = response.body!.map((openingHour) {
        return openingHour.copyWith(
          start: openingHour.start,
          end: openingHour.end,
        );
      }).toList();
      _openingHours = openingHours;
      return Result.success(openingHours);
    } catch (ex) {
      return Result.error(ex.toString());
    }
  }
}
