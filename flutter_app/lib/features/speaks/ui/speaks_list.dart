import "package:flutter/material.dart";
import "package:flutter_app/common/extensions/iterable.dart";
import "package:flutter_app/features/speaks/models/speak.dart";
import "package:flutter_app/features/speaks/ui/speak_row.dart";

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
            (speak, idx) => SpeakRow(speak: speak, id: idx),
          )
          .toList(),
    );
  }
}
