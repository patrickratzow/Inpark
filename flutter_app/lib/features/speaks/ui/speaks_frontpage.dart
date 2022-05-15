import "package:flutter/widgets.dart";
import "package:flutter_app/common/feature.dart";
import "package:flutter_app/common/ui/title_bar.dart";
import "package:flutter_app/features/speaks/models/speak.dart";
import "package:flutter_app/features/speaks/models/speak_model.dart";
import "package:flutter_app/features/speaks/ui/speaks_list.dart";
import "package:flutter_app/hooks/hooks.dart";

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
