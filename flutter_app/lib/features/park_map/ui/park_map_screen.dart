import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../../common/colors.dart";
import "../../../common/screen.dart";
import "../../../common/ui/screen_app_bar.dart";
import "park_map.dart";

class ParkMapScreen extends HookWidget implements NavigationPage {
  const ParkMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ScreenAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        systemUiOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: const ParkMap(),
    );
  }

  @override
  void onEnter(BuildContext context) {
    final style = SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    );
  }

  @override
  void onLeave(BuildContext context) {
    final style = SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: CustomColor.green.lightest,
    );
  }
}
