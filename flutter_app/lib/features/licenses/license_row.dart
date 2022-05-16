import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_app/features/licenses/license_list.dart";
import "package:flutter_app/features/licenses/package_screen.dart";
import "package:flutter_app/hooks/use_provider.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class LicenseRow extends HookWidget {
  final LicenseInfo license;
  final List<LicenseEntry> licenses;

  const LicenseRow({
    super.key,
    required this.license,
    required this.licenses,
  });

  @override
  Widget build(BuildContext context) {
    final navigator = useNavigator();
    final name = license.name;
    final count = license.licensesCount;
    final licensesText = count == 1 ? "1 licens" : "$count licenser";

    return ListTile(
      onTap: () {
        final licenseEntries = licenses
            .where((license) => license.packages.contains(name))
            .toList();

        navigator.push(
          context,
          PackageScreen(
            packageName: name,
            entries: licenseEntries,
          ),
        );
      },
      title: Text(name),
      subtitle: Text(licensesText),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
        size: 14.0,
      ),
    );
  }
}
