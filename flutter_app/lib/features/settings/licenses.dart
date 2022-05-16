import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_app/common/screen.dart";
import "package:flutter_app/common/ui/screen_app_bar.dart";
import "package:flutter_app/hooks/use_provider.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:package_info_plus/package_info_plus.dart";

class LicenseInfo {
  final String name;
  final int licensesCount;

  const LicenseInfo(
    this.name,
    this.licensesCount,
  );
}

class Licenses extends HookWidget implements Screen {
  const Licenses({super.key});

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

class LicenseAppInformation extends HookWidget {
  const LicenseAppInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final packageInfoFuture = useMemoized(() => PackageInfo.fromPlatform());
    final future = useFuture(packageInfoFuture);

    if (future.connectionState != ConnectionState.done) {
      return const CircularProgressIndicator();
    }

    final packageInfo = future.data!;
    final version = "${packageInfo.version} #${packageInfo.buildNumber}";

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Text(version),
        ],
      ),
    );
  }
}

class PackageScreen extends StatelessWidget implements Screen {
  final String packageName;
  final List<LicenseEntry> entries;

  const PackageScreen({
    Key? key,
    required this.packageName,
    required this.entries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(title: packageName),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          final isLast = index == entries.length - 1;
          final isFirst = index == 0;

          return Column(
            children: [
              if (!isFirst)
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Divider(color: Color(0xff959595)),
                ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  16,
                  isFirst ? 16 : 8,
                  16,
                  isLast ? 16 : 0,
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final line in entry.paragraphs)
                      // Create spaces for each indent where
                      Text(paragraphText(line)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String paragraphText(LicenseParagraph paragraph) {
    final indent = paragraph.indent;
    final text = paragraph.text;
    final builder = StringBuffer();
    for (var i = 0; i < indent; i++) {
      builder.write("    ");
    }
    builder.write(text);

    return builder.toString();
  }
}
