import "package:flutter/material.dart";
import "package:flutter_app/features/speaks/ui/speak_row.dart";
import "package:flutter_app/generated_code/zooinator.models.swagger.dart";

class SpeaksList extends StatelessWidget {
  final List<SpeakDto> speaks;

  const SpeaksList({
    Key? key,
    required this.speaks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: speaks
            .map(
              (s) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SpeakRow(speak: s),
              ),
            )
            .toList(),
      ),
    );
  }
}
