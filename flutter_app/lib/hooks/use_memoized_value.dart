import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

ValueNotifier<T> useMemoizedValue<T>(Duration duration, T Function() getState) {
  final state = useState(getState());
  useMemoized(
    () => Timer.periodic(
      duration,
      (timer) {
        final currentState = getState();
        if (currentState != state.value) {
          state.value = currentState;
        }
      },
    ),
  );

  return state;
}
