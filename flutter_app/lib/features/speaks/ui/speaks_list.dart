import "package:flutter/material.dart";
import 'package:flutter_app/features/speaks/models/speak.dart';
import 'package:flutter_app/features/speaks/models/speak_model.dart';
import "package:flutter_app/features/speaks/ui/speak_row.dart";
import "package:flutter_app/generated_code/zooinator.models.swagger.dart";

class SpeaksList extends StatelessWidget {
  final List<Speak> speaks;

  const SpeaksList({
    Key? key,
    required this.speaks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: speaks.asMap().entries.map((entry) {
        final idx = entry.key;
        final speak = entry.value;

        return SpeakRow(speak: speak, id: idx);
      }).toList(),
    );
  }
}
