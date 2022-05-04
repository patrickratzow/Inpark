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
    return Column(
      children: speaks.map((speak) => SpeakRow(speak: speak)).toList(),
    );
  }
}
