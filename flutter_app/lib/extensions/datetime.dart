import 'dart:core';

extension DateTimeExtensions on DateTime {
  DateTime asToday() {
    final now = DateTime.now();

    return DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
      second,
    );
  }
}
