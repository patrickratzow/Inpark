import "package:flutter/cupertino.dart";
import "package:flutter_app/common/feature.dart";
import "package:flutter_app/features/park_events/models/event_model.dart";
import "package:flutter_app/features/park_events/ui/event_container.dart";
import "package:flutter_app/hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class ParkEventsFeature extends Feature {
  @override
  String get featureId => "park_events";

  @override
  bool get isEnabled => true;

  @override
  EventContainer get frontPageMaterial => const EventContainer();

  @override
  Future setup(BuildContext context) async {
    final model = useProvider<ParkEventModel>();
    final hasBeenFetched = useRef(false);
    if (!hasBeenFetched.value) {
      hasBeenFetched.value = true;

      await model.fetchParkEvents();
    }
  }
}
