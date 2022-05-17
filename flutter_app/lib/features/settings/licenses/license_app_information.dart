import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:package_info_plus/package_info_plus.dart";

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
    final version = "${packageInfo.version}#${packageInfo.buildNumber}";
    final appName = packageInfo.appName;
    const appDescription =
        "Zooinator er en app for alle dine oplevelser i zoo! Lær mere om dyrene, bestil mad gennem appen og spring køen over, eller gem dit årskort hvor du nemt kan finde det samt meget mere!";
    const flutterString = "Lavet med Flutter";

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            appName,
            style: GoogleFonts.poppins(fontSize: 24),
          ),
          const FlutterLogo(),
          Text(version),
          const SizedBox(
            height: 16,
          ),
          Text(
            appDescription,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            flutterString,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
