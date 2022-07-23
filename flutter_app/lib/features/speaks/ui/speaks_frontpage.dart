import "package:flutter/widgets.dart";
import "package:flutter_use/flutter_use.dart";

import "../../../common/feature.dart";
import "../../../common/ui/title_bar.dart";
import "../../../hooks/hooks.dart";
import "../models/speak.dart";
import "../models/speak_model.dart";
import "speaks_list.dart";

class SpeaksFrontPage extends FrontPageWidget {
  const SpeaksFrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = useProvider<SpeakModel>();
    final activeSpeaks = useMemoizedValue<List<Speak>>(
      const Duration(seconds: 1),
      () => model.speaks,
    );

    useEffectOnce(() {
      model.fetchSpeaksForToday();

      return null;
    });

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TitleBar(name: "Dagens speaks & aktiviteter"),
        ),
        const SizedBox(height: 4),
        SpeaksList(speaks: activeSpeaks.value),
      ],
    );
  }

  @override
  bool shouldHide(BuildContext context) => false;
}
