part of "hooks.dart";

ValueNotifier<T> useMemoizedValue<T>(Duration duration, T Function() getState) {
  final state = useState(getState());
  final timer = useMemoized(
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
  useEffectOnce(() => () => timer.cancel());

  return state;
}
