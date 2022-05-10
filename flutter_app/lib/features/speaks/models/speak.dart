import "dart:convert";
import 'dart:math';

import 'package:flutter_app/extensions/datetime.dart';

import "../../../generated_code/zooinator.models.swagger.dart";

enum SpeakState { upcoming, happeningSoon, happening, over }

class Speak {
  final String title;
  final DateTime start;
  final ImagePairDto image;
  final List<String> days;

  Speak(this.title, this.start, this.image, this.days);

  String get previewImage => image.previewUrl;
  String get fullscreenImage => image.fullscreenUrl;

  bool hasBegun() {
    // True if it has begun
    return start.compareTo(start.asToday()) != 1;
  }

  int? _id;
  int get id => _id ??= utf8.encode(title).reduce((curr, prev) => curr + prev);

  SpeakState get state {
    final startTime = start.asToday();
    final difference = startTime.difference(DateTime.now());
    if (difference.inMinutes > 15) return SpeakState.upcoming;
    if (difference.inMinutes > 0) return SpeakState.happeningSoon;
    if (difference.inMinutes > -30) return SpeakState.happening;

    return SpeakState.over;
  }
}
