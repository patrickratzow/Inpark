import 'package:flutter/material.dart';
import 'package:flutter_app/common/extensions/iterable.dart';
import 'package:flutter_app/common/ioc.dart';
import 'package:flutter_app/features/calendar/repository/calendar_repository.dart';
import "package:intl/intl.dart";

import '../../../common/result.dart';
import "calendar_date_counter.dart";
import "calendar_event.dart";

class CalendarModel extends ChangeNotifier {
  int year;
  int month;
  int day;
  int? selectedDay;
  DateTime? lastSelectedDate;
  List<CalendarEvent> _calendarEvents = List.empty();

  CalendarModel(DateTime date)
      : year = date.year,
        month = date.month,
        day = date.day,
        selectedDay = date.day,
        lastSelectedDate = date {
    var repository = locator.get<CalendarRepository>();
    repository.fetchEvents().then(
          (value) => {
            _calendarEvents = value,
            notifyListeners(),
          },
        );
  }

  DateTime get date => DateTime(year, month, day);
  int get daysInMonth => difference(1).inDays;
  int get daysInPreviousMonth => difference(-1).inDays;

  nextMonth() {
    if (month == 12) {
      year++;
      month = 1;
    } else {
      month++;
    }

    day = 1;
    selectedDay = null;
    if (year == lastSelectedDate?.year && month == lastSelectedDate?.month) {
      selectedDay = lastSelectedDate?.day;
    }

    notifyListeners();
  }

  previousMonth() {
    if (month == 1) {
      year--;
      month = 12;
    } else {
      month--;
    }

    day = 1;
    selectedDay = null;
    if (year == lastSelectedDate?.year && month == lastSelectedDate?.month) {
      selectedDay = lastSelectedDate?.day;
    }

    notifyListeners();
  }

  selectDay(int day) {
    lastSelectedDate = DateTime(year, month, day);
    selectedDay = day;

    notifyListeners();
  }

  Result<List<CalendarEvent>, String> getTodaysEvents() {
    if (selectedDay == null) return Result.error("none_selected");
    if (_calendarEvents.isEmpty) return Result.error("loading");

    final today = DateTime(year, month, selectedDay!);

    var events = _calendarEvents
        .where(
          (x) {
            var diff = today.difference(x.start).inDays;

            // Must be 0 days or above difference. If -1 or less it'd be in the future
            return diff >= 0;
          },
        )
        .where(
          (x) {
            if (x.end == null) return true;

            var diff = today.difference(x.end!).inDays;

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

  Duration difference(int months) {
    assert(months != 0);

    DateTime next;
    if (months > 0) {
      // If the month is december go to next year
      next = month == DateTime.december
          ? DateTime(year + 1, 1)
          : DateTime(year, month + 1);
    } else {
      next = month == DateTime.january
          ? DateTime(year - 1, 12)
          : DateTime(year, month - 1);
    }

    return next.toUtc().difference(date);
  }

  DateFormat _formatter(String format) => DateFormat(format, "da");

  String get monthName => _formatter("MMMM yyyy").format(date).toString();

  List<String> get weekdays {
    List<String> days = [];

    var date = DateTime(2022, 05, 02);
    for (var i = 0; i < 7; i++) {
      var abbreviation =
          _formatter(DateFormat.ABBR_WEEKDAY).format(date).toString();
      days.add(abbreviation);

      date = date.add(const Duration(days: 1));
    }

    return days;
  }

  // Check if offset is inside the range of the current month by looking at offsets from the first day of the month
  bool isInsideMonth(int offset) {
    // Before current
    var weekdayOffset = DateTime(year, month, 1).weekday - 1;
    if (offset < weekdayOffset) return false;
    // After current
    if (offset > daysInMonth + (weekdayOffset - 1)) return false;

    return true;
  }

  int get rows {
    var days = daysInMonth;
    var amountOfRows = (days / 7).ceil();
    var counter = CalendarDateCounter();

    var offset = 0;
    for (var i = 0; i < amountOfRows; i++) {
      for (var j = 0; j < 7; j++) {
        var isActive = isInsideMonth(offset);
        counter.increment(isActive);

        offset++;
      }
    }

    var totalDays = days + counter.previous + counter.next;
    return (totalDays / 7).ceil();
  }
}
