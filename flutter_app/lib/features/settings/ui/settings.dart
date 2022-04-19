import "package:flutter/material.dart";
import 'package:flutter_app/features/settings/ui/setting_row_route.dart';
import 'package:flutter_app/features/settings/ui/setting_row_toggle.dart';
import "package:flutter_app/features/settings/ui/settings_title_bar.dart";
import "../../../common/ui/screen_app_bar.dart";

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScreenAppBar(name: "Settings"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            const SettingsTitleBar(name: "Account"),
            const SettingRowRoute(
              iconName: "avatar",
              name: "Profile",
              route: "non",
            ),
            const SettingRowRoute(
              iconName: "ticketCollerless",
              name: "My Tickets",
              route: "non",
            ),
            const SettingRowRoute(
              iconName: "notifications",
              name: "Notifications",
              route: "non",
            ),
            const SettingsTitleBar(name: "More"),
            const SettingRowRoute(
              iconName: "help",
              name: "Help",
              route: "non",
            ),
            SettingRowToggle(
              iconName: "help",
              name: "Lightmode",
              route: "non",
            ),
          ],
        ),
      ),
    );
  }
}
