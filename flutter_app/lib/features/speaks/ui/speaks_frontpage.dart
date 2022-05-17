import "package:flutter/widgets.dart";
import "../../../common/feature.dart";
import "../../../common/ui/title_bar.dart";
import "../models/speak.dart";
import "../models/speak_model.dart";
import "speaks_list.dart";
import "../../../hooks/hooks.dart";

class SpeaksFrontPage extends FrontPageWidget {
  const SpeaksFrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = useProvider<SpeakModel>()..fetchSpeaksForToday();
    final activeSpeaks = useMemoizedValue<List<Speak>>(
      const Duration(seconds: 1),
      () => model.speaks
          //.where((speak) => speak.state != SpeakState.over)
          .toList(),
    );

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TitleBar(name: "Dagens speaks"),
        ),
        const SizedBox(height: 4),
        SpeaksList(speaks: activeSpeaks.value),
      ],
    );
  }

  @override
  bool shouldHide(BuildContext context) => false;
}
