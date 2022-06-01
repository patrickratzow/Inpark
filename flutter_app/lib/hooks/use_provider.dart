part of "hooks.dart";

T useProvider<T>({
  bool watch = false,
  BuildContext? context = null,
}) {
  context ??= useContext();
  final provider = watch ? context.watch<T>() : context.read<T>();

  return provider;
}
