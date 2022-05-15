import "package:flutter/cupertino.dart";
import "package:flutter_app/common/feature.dart";
import "package:flutter_app/features/home/models/home_model.dart";
import "package:flutter_app/features/home/ui/opening_hours.dart";
import "package:flutter_app/hooks/hooks.dart";
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
