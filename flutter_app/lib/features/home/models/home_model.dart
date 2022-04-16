import "package:flutter/material.dart";
import "package:flutter_app/common/ioc.dart";
import "package:flutter_app/features/home/repositories/home_repository.dart";
import "package:flutter_app/generated_code/zooinator.swagger.dart";

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

  // TODO: Support multiple opening hours
  String get openingHours {
    if (_openingHours.isEmpty) {
      return "Vi har lukket i dag";
    }

    final openingHour = _openingHours.first;
    final start = openingHour.start.hour;
    final end = openingHour.end.hour;
    return "Vi har åbent i dag fra kl. $start - $end";
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
