import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

String useDateRange(
  DateTime startTime,
  DateTime? endTime, {
  bool fullMonth = true,
}) {
  return useMemoized(
    () {
      final extraMonth = fullMonth ? "M" : "";
      final DateFormat noYearFormatter = DateFormat("d. MMM$extraMonth", "da");
      final DateFormat yearFormatter =
          DateFormat("d. MMM$extraMonth yyyy", "da");

      final builder = StringBuffer();
      if (endTime == null || _isSameDate(startTime, endTime)) {
        builder.write(yearFormatter.format(startTime));
      } else {
        builder.write(noYearFormatter.format(startTime));
        builder.write(" - ");
        builder.write(yearFormatter.format(endTime));
      }

      return builder.toString();
    },
    [startTime, endTime, fullMonth],
  );
}

bool _isSameDate(DateTime start, DateTime end) =>
    start.difference(end).inDays == 0;
