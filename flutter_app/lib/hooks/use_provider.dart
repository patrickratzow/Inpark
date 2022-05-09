import "package:flutter/widgets.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:provider/provider.dart";

T useProvider<T>({
  bool watch = false,
  Function(T provider)? onInit,
}) =>
    use(_UseProviderHook<T>(watch: watch, onInit: onInit));

class _UseProviderHook<T> extends Hook<T> {
  final bool watch;
  final Function(T provider)? onInit;

  const _UseProviderHook({
    this.watch = false,
    this.onInit,
  });

  @override
  HookState<T, _UseProviderHook<T>> createState() => _UseProviderHookState<T>();
}

class _UseProviderHookState<T> extends HookState<T, _UseProviderHook<T>> {
  @override
  T build(BuildContext context) {
    final provider = hook.watch ? context.watch<T>() : context.read<T>();
    if (hook.onInit != null) {
      hook.onInit!(provider);
    }

    return provider;
  }
}
