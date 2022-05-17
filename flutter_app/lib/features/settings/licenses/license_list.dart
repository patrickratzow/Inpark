import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_app/common/screen.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";
import "package:flutter_app/features/settings/licenses/license_app_information.dart";
import "package:flutter_app/features/settings/licenses/license_row.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class LicenseInfo {
  final String name;
  final int licensesCount;

  const LicenseInfo(
    this.name,
    this.licensesCount,
  );
}

class LicenseList extends HookWidget implements Screen {
  const LicenseList({super.key});

  @override
  Widget build(BuildContext context) {
    final licensesFuture = useMemoized(() => LicenseRegistry.licenses.toList());
    final future = useFuture(licensesFuture);
    final licenseCount = useMemoized(
      () {
        final map = <String, int>{};
        if (future.data == null) return map;

        for (final package
            in future.data!.expand((license) => license.packages)) {
          if (map.containsKey(package)) {
            map[package] = map[package]! + 1;
          } else {
            map[package] = 1;
          }
        }

        return map;
      },
      [future.data],
    );
    final licenses = useMemoized(
      () => licenseCount.entries
          .map((entry) => LicenseInfo(entry.key, entry.value))
          .toList()
        ..sort(
          (a, b) => a.name.compareTo(b.name),
        ),
      [licenseCount],
    );

    Widget body;
    if (future.connectionState != ConnectionState.done) {
      body = const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      body = ListView.builder(
        itemCount: licenses.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const LicenseAppInformation();
          }

          final license = licenses[index - 1];
          return LicenseRow(
            license: license,
            licenses: future.data!,
          );
        },
      );
    }

    return Scaffold(
      appBar: const ScreenAppBar(title: "Licenser"),
      body: body,
    );
  }
}
