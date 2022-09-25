import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_app/common/screen.dart";
import "package:flutter_app/common/web_view_screen.dart";
import "package:flutter_app/content/demo.dart";
import "package:flutter_app/features/settings/licenses/license_list.dart";
import "package:flutter_app/features/settings/ui/setting_row.dart";
import "package:flutter_app/features/settings/ui/settings_title_bar.dart";
import "package:flutter_app/hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../../common/ui/screen_app_bar.dart";
import "../../../log_in/ui/login_settings.dart";
import "../../../navigation/navigation_model.dart";
import "notification_settings_page.dart";

class SettingsScreen extends HookWidget implements Screen {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = useNavigator();

    return Scaffold(
      appBar: const ScreenAppBar(title: "Indstillinger"),
      body: Column(
        children: [
          const LoginSettings(),
          ..._buildGeneral(context, navigator),
          ..._buildMisc(context, navigator),
          ..._buildDevelopment(context, navigator),
        ],
      ),
    );
  }

  List<Widget> _buildGeneral(BuildContext context, NavigationModel navigator) {
    return [
      const SettingsTitleBar(name: "Generelt"),
      SettingRow(
        leading: const Icon(
          Icons.notifications,
          color: Colors.black,
          size: 16.0,
        ),
        name: "Notifikationer",
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 16.0,
        ),
        onPressed: () => {
          {
            navigator.push(
              context,
              const NotificationSettingsPage(),
            ),
          }
        },
      )
    ];
  }

  List<Widget> _buildMisc(BuildContext context, NavigationModel navigator) {
    return [
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
    ];
  }

  List<Widget> _buildDevelopment(
    BuildContext context,
    NavigationModel navigator,
  ) {
    if (kReleaseMode) {
      return [];
    }

    return [
      const SettingsTitleBar(name: "Udvikling"),
      SettingRow(
        leading: const Icon(
          Icons.help,
          color: Colors.black,
          size: 16.0,
        ),
        name: "SDUI - Bevaringsstatus",
        onPressed: () => {
          navigator.push(
            context,
            const SDUIScreen(),
            hide: true,
          )
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
        name: "SDUI - Navbar",
        onPressed: () => {
          navigator.push(
            context,
            const SDUIScreen(),
            hide: true,
          )
        },
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 16.0,
        ),
      ),
    ];
  }
}
