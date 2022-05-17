import "package:flutter/material.dart";
import "../../../common/extensions/iterable.dart";
import "../../../common/ioc.dart";
import "../repositories/home_repository.dart";
import "../../../generated_code/zooinator.swagger.dart";

class HomeModel extends ChangeNotifier {
  List<OpeningHourDto> _openingHours = List.empty();
  String error = "";
  bool loading = false;

  String greetingText({DateTime? dateTime}) {
    dateTime ??= DateTime.now();
    if (dateTime.hour >= 3 && dateTime.hour < 11) {
      return "God Morgen";
    } else if (dateTime.hour >= 11 && dateTime.hour < 14) {
      return "God Middag";
    } else if (dateTime.hour >= 14 && dateTime.hour < 17) {
      return "God Eftermiddag";
    } else if (dateTime.hour >= 17 || dateTime.hour < 3) {
      return "God Aften";
    }
    return "Goddag";
  }

  String get openingHours {
    if (_openingHours.isEmpty) {
      return "Vi har lukket i dag";
    }

    final hours = _openingHours
        .where((x) => x.open)
        .groupBy((x) => x.start)
        .entries
        .map((x) => x.value.maxBy((x) => x.end))
        .map((x) => x.start.hour.toString() + "-" + x.end.hour.toString())
        .toList();

    return "Åben i dag fra kl. " + hours.join(" og ");
  }

  Future<void> fetchOpeningHoursForToday() async {
    final homeRepository = locator.get<HomeRepository>();

    try {
      loading = true;

      var openingHoursResult = await homeRepository.fetchOpeningHoursForToday();
      if (openingHoursResult.isSuccess) {
        _openingHours = openingHoursResult.success!;
      } else {
        error = openingHoursResult.error.toString();
      }
    } finally {
      loading = false;

      notifyListeners();
    }
  }
}
