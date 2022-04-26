import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_app/common/colors.dart";
import "package:flutter_custom_tabs/flutter_custom_tabs.dart";

class Url {
  static void launchUrl(BuildContext context, String url) async {
    try {
      await launch(
        url,
        customTabsOption: CustomTabsOption(
          toolbarColor: CustomColor.green.lightest,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            "org.mozilla.firefox",
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            "com.microsoft.emmx",
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: Theme.of(context).primaryColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
}
