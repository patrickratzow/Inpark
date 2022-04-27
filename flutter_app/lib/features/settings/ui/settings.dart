import "package:flutter/material.dart";
import "package:flutter_app/features/settings/ui/setting_row.dart";
import "package:flutter_app/features/settings/ui/settings_title_bar.dart";
import "../../../common/ui/screen_app_bar.dart";
import "../../../common/ui/switch.dart";

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScreenAppBar(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            const SettingsTitleBar(name: "Account"),
            const SettingRow(
              iconName: "avatar",
              name: "Profile",
              route: "non",
              widget: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
            ),
            const SettingRow(
              iconName: "ticketCollerless",
              name: "My Tickets",
              route: "non",
              widget: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
            ),
            const SettingRow(
              iconName: "notifications",
              name: "Notifications",
              route: "non",
              widget: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
            ),
            const SettingsTitleBar(name: "More"),
            const SettingRow(
              iconName: "help",
              name: "Help",
              route: "non",
              widget: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16.0,
              ),
            ),
            SettingRow(
              iconName: "help",
              name: "Lightmode",
              route: "non",
              widget: StatefullSwitch(),
            ),
          ],
        ),
      ),
    );
  }
}
