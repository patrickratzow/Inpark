import "package:flutter/foundation.dart";
import "package:intl/intl.dart";

part "opening_hour_calendar_event.dart";

@immutable
abstract class CalendarEvent {
  String get title;
  String get body;
  DateTime get start;
  DateTime? get end;
  bool get open;

  const CalendarEvent();
}
