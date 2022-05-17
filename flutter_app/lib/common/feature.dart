import "package:flutter/widgets.dart";
import "package:flutter_app/features/home/opening_hours_feature.dart";
import "package:flutter_app/features/park_events/park_events_feature.dart";
import "package:flutter_app/features/speaks/speaks_feature.dart";
import "package:flutter_hooks/flutter_hooks.dart";

abstract class Feature {
  String get featureId;
  bool get isEnabled;
  FrontPageWidget? get frontPageMaterial;
  Future setup(BuildContext context);
}

abstract class FrontPageWidget extends HookWidget {
  bool shouldHide(BuildContext context);

  final EdgeInsets padding;

  const FrontPageWidget({
    super.key,
    this.padding = const EdgeInsets.only(bottom: 16),
  });
}

class Features {
  static SpeaksFeature speaks = SpeaksFeature();
  static OpeningHoursFeature openingHours = OpeningHoursFeature();
  static ParkEventsFeature parkEvents = ParkEventsFeature();

  static Set<Feature> features = {openingHours, parkEvents, speaks};

  static Iterable<FrontPageFeature> get frontPage sync* {
    for (final feature in features) {
      if (!feature.isEnabled) continue;
      if (feature.frontPageMaterial == null) continue;

      yield FrontPageFeature(feature);
    }
  }
}

class FrontPageFeature {
  final Feature _feature;
  bool hasRunSetup = false;

  FrontPageFeature(this._feature) : assert(_feature.frontPageMaterial != null);

  FrontPageWidget? get frontPageMaterial => _feature.frontPageMaterial;

  Future setup(BuildContext context) async {
    if (hasRunSetup) return;

    hasRunSetup = true;
    await _feature.setup(context);
  }
}