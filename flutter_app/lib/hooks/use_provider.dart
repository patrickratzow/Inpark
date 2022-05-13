import "package:flutter_app/common/ioc.dart";
import "package:flutter_app/navigation/navigation_model.dart";
import "package:flutter_app/services/capability_service.dart";
import "package:flutter_app/services/policy_service.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:provider/provider.dart";

part "use_navigator.dart";

T useProvider<T>({
  bool watch = false,
  Function(T provider)? onInit,
}) {
  final context = useContext();

  return useMemoized(
    () {
      final provider = watch ? context.watch<T>() : context.read<T>();
      onInit?.call(provider);

      return provider;
    },
    [T],
  );
}

PolicyService usePolicies() => locator.get<PolicyService>();
CapabilityService useCapabilities() => locator.get<CapabilityService>();
