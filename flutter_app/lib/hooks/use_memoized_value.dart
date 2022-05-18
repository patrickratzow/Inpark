part of "hooks.dart";

ValueNotifier<T> useMemoizedValue<T>(Duration duration, T Function() getState) {
  final state = useState(getState());
  final timer = useRef(
    Timer.periodic(
      duration,
      (timer) {
        final currentState = getState();
        if (currentState != state.value) {
          state.value = currentState;
        }
      },
    ),
  );
  useEffectOnce(() => () => timer.value.cancel());

  return state;
}
