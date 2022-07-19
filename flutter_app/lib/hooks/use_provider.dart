part of "hooks.dart";

T useProvider<T>({
  bool watch = false,
}) {
  final context = useContext();
  final provider = watch ? context.watch<T>() : context.read<T>();

  return provider;
}
