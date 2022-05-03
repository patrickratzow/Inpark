import "package:flutter/material.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";
import "package:flutter_app/features/speaks/models/speak_model.dart";
import 'package:flutter_app/features/speaks/ui/speaks_list.dart';
import 'package:flutter_app/generated_code/zooinator.swagger.dart';
import "package:provider/provider.dart";

class SpeaksOverviewScreen extends StatelessWidget {
  final List<SpeakDto> speaks;
  const SpeaksOverviewScreen({
    Key? key,
    required this.speaks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SpeakModel>().fetchSpeaksForToday();

    return Scaffold(
      appBar: const ScreenAppBar(title: "Alle Aktiviteter og Speaks"),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SpeaksList(speaks: speaks),
          ],
        ),
      ),
    );
  }
}
