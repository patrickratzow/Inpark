import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../generated_code/zooinator.models.swagger.dart';

@immutable
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
    // True if it has begun
    return start.compareTo(now) != 1;
  }

  int? _id;
  int get id => _id ??= utf8.encode(title).reduce((curr, prev) => curr + prev);
}
