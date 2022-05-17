import "package:flutter/cupertino.dart";
import "../../common/feature.dart";
import "models/home_model.dart";
import "ui/opening_hours.dart";
import "../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class OpeningHoursFeature extends Feature {
  @override
  String get featureId => "opening_hours";

  @override
  bool get isEnabled => true;

  @override
  OpeningHours get frontPageMaterial => const OpeningHours();

  @override
  Future setup(BuildContext context) async {
    final home = useProvider<HomeModel>();
    final hasBeenFetched = useRef(false);
    if (!hasBeenFetched.value) {
      hasBeenFetched.value = true;

      await home.fetchOpeningHoursForToday();
    }
  }
}
