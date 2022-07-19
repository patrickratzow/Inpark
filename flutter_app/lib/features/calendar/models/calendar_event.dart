import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:intl/intl.dart";

part "opening_hour_calendar_event.dart";

@immutable
abstract class CalendarEvent {
  String get title;
  String get body;
  DateTime get start;
  DateTime? get end;
  bool get open;
  Color? get color;

  const CalendarEvent();
}
