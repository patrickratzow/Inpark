import "package:flutter/material.dart";
import "package:flutter_app/common/screen.dart";
import "package:flutter_app/common/web_view_screen.dart";
import "package:flutter_app/features/licenses/license_list.dart";
import "package:flutter_app/features/settings/ui/setting_row.dart";
import "package:flutter_app/features/settings/ui/settings_title_bar.dart";
import "package:flutter_app/hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../../common/screen.dart";
import "../../../common/ui/screen_app_bar.dart";
import "setting_row.dart";
import "settings_title_bar.dart";

class SettingsScreen extends HookWidget implements Screen {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = useNavigator();

    return Scaffold(
      appBar: const ScreenAppBar(title: "Indstillinger"),
      body: Column(
        children: [
          const SettingsTitleBar(name: "Generelt"),
          /*
          const SettingRow(
            iconName: "avatar",
            name: "Profile",
            widget: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 16.0,
            ),
          ),
          const SettingRow(
            iconName: "ticketCollerless",
            name: "My Tickets",
            widget: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 16.0,
            ),
          ),
          */
          const SettingRow(
            leading: Icon(
              Icons.settings,
              color: Colors.black,
              size: 16.0,
            ),
            name: "Notifikationer",
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 16.0,
            ),
          ),
          const SettingsTitleBar(name: "Andet"),
          SettingRow(
            leading: const Icon(
              Icons.help,
              color: Colors.black,
              size: 16.0,
            ),
            name: "Privatlivspolitik",
            onPressed: () => {
              {
                navigator.push(
                  context,
                  const WebViewScreen(
                    title: "Privatlivspolitik",
                    url: "https://job.aalborgzoo.dk/privacy-policy",
                  ),
                ),
              }
            },
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 16.0,
            ),
          ),
          SettingRow(
            leading: const Icon(
              Icons.help,
              color: Colors.black,
              size: 16.0,
            ),
            name: "Om App",
            onPressed: () => {
              navigator.push(
                context,
                const LicenseList(),
              )
            },
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 16.0,
            ),
          ),
          // SettingRow(
          //   iconName: "help",
          //   name: "Om App",
          //   onPressed: () => showAboutDialog(
          //     context: context,
          //     applicationIcon: const FlutterLogo(),
          //     applicationName: "Zooinator",
          //     applicationVersion: "0.4.0",
          //     applicationLegalese:
          //         "Zooinator er en app for alle dine oplevelser i zoo! Lær mere om dyrene, bestil mad gennem appen og spring køen over, eller gem dit årskort hvor du nemt kan finde det samt meget mere!",
          //   ),
          //   widget: const Icon(
          //     Icons.arrow_forward_ios,
          //     color: Colors.black,
          //     size: 16.0,
          //   ),
          // ),
        ],
      ),
    );
  }
}
