import "package:collection_ext/iterables.dart";
import "package:flutter/material.dart";
import "../models/speak.dart";
import "speak_row.dart";

class SpeaksList extends StatelessWidget {
  final List<Speak> speaks;

  const SpeaksList({
    super.key,
    required this.speaks,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: speaks
          .mapIndexed(
            (idx, speak) => SpeakRow(speak: speak, id: idx),
          )
          .toList(),
    );
  }
}
