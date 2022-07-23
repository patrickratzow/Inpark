part of "calendar_event.dart";

const openingHourColors = {
  "10-15": Colors.green,
  "16-21": Colors.amber,
};

@immutable
class OpeningHourCalendarEvent extends CalendarEvent {
  final DateTime _start;
  final DateTime? _end;
  @override
  final bool open;
  final Color? color;

  const OpeningHourCalendarEvent(this._start, this._end, this.open, this.color);

  @override
  String get body {
    return open ? "Åben" : "Lukket";
  }

  @override
  String get title {
    var start = _format(_start);
    var title = "Kl. " + start;

    if (_end != null) {
      var end = _format(_end!);
      title = title + "-" + end;
    }

    return title;
  }

  @override
  DateTime? get end => _end;

  @override
  DateTime get start => _start;

  String _format(DateTime dateTime) {
    var format =
        dateTime.minute == 0 ? DateFormat.HOUR24 : DateFormat.HOUR24_MINUTE;
    return DateFormat(format).format(dateTime);
  }
}
