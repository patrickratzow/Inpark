import "dart:convert";

import "../../../extensions/datetime.dart";
import "../../../generated_code/zooinator.models.swagger.dart";

import "speak_state.dart";

class Speak {
  final String _title;
  final DateTime start;
  final ImagePairDto image;
  final List<String> days;

  String get title => _title.split("|").first;

  Speak(this._title, DateTime start, this.image, this.days)
      : start = start.asToday();

  String get previewImage => image.previewUrl;
  String get fullscreenImage => image.fullscreenUrl;
  bool get hasBegun => start.isBefore(DateTime.now());

  int? _id;
  int get id => _id ??= utf8.encode(_title).reduce((curr, prev) => curr + prev);

  SpeakState get state {
    final startTime = start;
    final difference = startTime.difference(DateTime.now());
    if (difference.inMinutes > 15) return SpeakState.upcoming;
    if (difference.inMinutes > 0) return SpeakState.happeningSoon;
    if (difference.inMinutes > -30) return SpeakState.happening;

    return SpeakState.over;
  }
}
