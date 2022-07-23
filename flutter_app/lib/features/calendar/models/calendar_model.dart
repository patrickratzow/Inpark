import "package:flutter/material.dart";
import "package:flutter_app/common/extensions/iterable.dart";
import "package:flutter_app/common/result.dart";
import "../../../common/ioc.dart";
import "../repository/calendar_repository.dart";

import "calendar_event.dart";

class CalendarModel extends ChangeNotifier {
  DateTime _selectedDay;
  DateTime get selectedDay => _selectedDay;
  void set selectedDay(DateTime value) {
    _selectedDay = value;

    notifyListeners();
  }

  List<CalendarEvent> _calendarEvents = List.empty();
  bool get isLoading => _calendarEvents.isEmpty;

  DateTime get firstDay {
    var calendarEvents = [..._calendarEvents];
    calendarEvents.sort((a, b) => a.start.compareTo(b.start));

    return calendarEvents.first.start;
  }

  DateTime get lastDay {
    var calendarEvents = [..._calendarEvents];
    calendarEvents.sort((a, b) => a.start.compareTo(b.start));

    return calendarEvents.last.start;
  }

  CalendarModel(this._selectedDay) {
    var repository = locator.get<CalendarRepository>();
    repository.fetchEvents().then(
          (value) => {
            _calendarEvents = value,
            notifyListeners(),
          },
        );
  }

  Result<List<CalendarEvent>, String> getCalendarEventsForDay(DateTime day) {
    if (_calendarEvents.isEmpty) return Result.error("loading");

    var events = _calendarEvents
        .where(
          (x) {
            var diff = day.difference(x.start).inDays;

            // Must be 0 days or above difference. If -1 or less it'd be in the future
            return diff >= 0;
          },
        )
        .where(
          (x) {
            if (x.end == null) return true;

            var diff = day.difference(x.end!).inDays;

            // Must be 0 days or below difference. If 1 or more it'd be in the past
            return diff <= 0;
          },
        )
        .groupBy((x) => x.start.hour)
        .entries
        .map((x) {
          var copy = List<CalendarEvent>.from(x.value);
          copy.sort(
            (a, b) {
              var inThePast = (a.end?.hour ?? a.start.hour) <=
                  (b.end?.hour ?? b.start.hour);

              return inThePast ? 1 : -1;
            },
          );

          return copy.first;
        })
        .toList();

    if (events.length == 1 && events.first.body == "Lukket") {
      return Result.success([]);
    }

    return Result.success(events.reversed.toList());
  }
}
