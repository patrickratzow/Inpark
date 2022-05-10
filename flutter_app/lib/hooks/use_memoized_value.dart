import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

ValueNotifier<T> useMemoizedValue<T>(Duration duration, T Function() callback) {
  final state = useState(callback());
  useMemoized(
    () => Timer.periodic(
      duration,
      (timer) {
        final currentState = callback();
        if (currentState != state.value) {
          state.value = currentState;

          state.notifyListeners();
        }
      },
    ),
  );

  return state;
}
