import "package:flutter/material.dart";
import "../../../common/screen.dart";
import "../../../common/ui/screen_app_bar.dart";
import "../models/speak.dart";
import "../models/speak_model.dart";
import "speaks_list.dart";
import "../../../hooks/hooks.dart";

class SpeaksOverviewScreen extends StatelessWidget implements Screen {
  final List<Speak> speaks;

  const SpeaksOverviewScreen({
    super.key,
    required this.speaks,
  });

  @override
  Widget build(BuildContext context) {
    useProvider<SpeakModel>().fetchSpeaksForToday();

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
