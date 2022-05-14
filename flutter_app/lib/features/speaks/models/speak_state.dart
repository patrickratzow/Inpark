import "package:flutter/material.dart";

import "speak_color_pair.dart";

const _defaultPair = SpeakColorPair(
  Colors.grey,
  Colors.grey,
);

enum SpeakState {
  upcoming(_defaultPair),
  happening(
    SpeakColorPair(
      Color(0xff698665),
      Color(0xffECFCE5),
    ),
  ),
  happeningSoon(
    SpeakColorPair(
      Color(0xfff1c40f),
      Color(0xffECFCE5),
    ),
  ),
  over(_defaultPair);

  final SpeakColorPair color;

  const SpeakState(
    this.color,
  );
}
