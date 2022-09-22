import "package:flutter/material.dart";
import "package:flutter_app/hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../features/settings/ui/setting_row.dart";
import "../../features/settings/ui/settings_title_bar.dart";
import "../../navigation/navigation_model.dart";
import "../models/user_model.dart";
import "../services/google_authentication_provider.dart";
import "login_page.dart";

class LoginSettings extends HookWidget {
  const LoginSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = useNavigator();
    final userModel = useProvider<UserModel>(watch: true);

    return Column(
      children: [
        const SettingsTitleBar(name: "Din Konto"),
        userModel.currentUser == null
            ? _buildLogin(navigator, context)
            : _buildProfile(userModel)
      ],
    );
  }

  Widget _buildProfile(UserModel userModel) {
    return Column(
      children: [
        Text(
          "Velkommen " + userModel.currentUser!.displayName.toString(),
        ),
        const Text("Dine oplysinger"),
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: () {
            userModel.signOut(GoogleAuthenticationProvider());
          },
          child: const Text("Log ud"),
        )
      ],
    );
  }

  Widget _buildLogin(NavigationModel navigator, BuildContext context) {
    return Column(
      children: [
        const Text("Du er ikke logget ind"),
        SettingRow(
          leading: const Icon(
            Icons.account_circle,
            color: Colors.black,
            size: 16.0,
          ),
          name: "Log in",
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 16.0,
          ),
          onPressed: () => {
            {
              navigator.push(
                context,
                const LoginPage(),
              ),
            }
          },
        )
      ],
    );
  }
}

List<Widget> _buildLogin(
  BuildContext context,
  NavigationModel navigator,
  UserModel userModel,
) {
  if (userModel.currentUser == null) {
    return [
      const SettingsTitleBar(name: "Din Konto"),
    ];
  } else {
    return [];
  }
}
