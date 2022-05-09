import "dart:convert";

import "../../../generated_code/zooinator.models.swagger.dart";

class Speak {
  final String title;
  final DateTime start;
  final ImagePairDto image;
  final List<String> days;

  Speak(this.title, this.start, this.image, this.days);

  String get previewImage => image.previewUrl;
  String get fullscreenImage => image.fullscreenUrl;

  bool hasBegun() {
    var now = DateTime.now();
    var normalizedTime = DateTime(
      start.year,
      start.month,
      start.day,
      now.hour,
      now.minute,
      now.second,
    );

    // True if it has begun
    return start.compareTo(normalizedTime) != 1;
  }

  int? _id;
  int get id => _id ??= utf8.encode(title).reduce((curr, prev) => curr + prev);
}
