import "package:flutter/cupertino.dart";
import "../../common/feature.dart";
import "models/event_model.dart";
import "ui/event_container.dart";
import "../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class ParkEventsFeature extends Feature {
  @override
  String get featureId => "park_events";

  @override
  bool get isEnabled => true;

  @override
  EventContainer get frontPageMaterial => EventContainer();

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
