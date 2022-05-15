import "package:flutter/cupertino.dart";
import "package:flutter_app/common/feature.dart";
import "package:flutter_app/features/speaks/models/speak_model.dart";
import "package:flutter_app/features/speaks/ui/speaks_frontpage.dart";
import "package:flutter_app/hooks/hooks.dart";
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
