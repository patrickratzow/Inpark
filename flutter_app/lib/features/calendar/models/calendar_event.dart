import "dart:core";

import "package:flutter/material.dart";
import "package:intl/intl.dart";

part "opening_hour_calendar_event.dart";

@immutable
abstract class CalendarEvent implements Comparable<CalendarEvent> {
  String get title;
  String get body;
  DateTime get start;
  DateTime? get end;
  bool get open;
  Color? get color;

  const CalendarEvent();

  int compareTo(CalendarEvent other) => start.compareTo(other.start);

  static int compare(Comparable a, Comparable b) => a.compareTo(b);
}
