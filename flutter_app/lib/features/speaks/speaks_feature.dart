import "package:flutter/cupertino.dart";
import "../../common/feature.dart";
import "models/speak_model.dart";
import "ui/speaks_frontpage.dart";
import "../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class SpeaksFeature extends Feature {
  @override
  String get featureId => "speaks";

  @override
  bool get isEnabled => true;

  @override
  SpeaksFrontPage get frontPageMaterial => const SpeaksFrontPage();

  @override
  Future setup(BuildContext context) async {
    final home = useProvider<SpeakModel>();
    final hasBeenFetched = useRef(false);
    if (!hasBeenFetched.value) {
      hasBeenFetched.value = true;

      await home.fetchSpeaksForToday();
    }
  }
}
