import "package:flutter/material.dart";

import '../../../common/ui/switch.dart';
import "../../../routes.dart";

class SettingRowToggle extends StatelessWidget {
  SettingRowToggle({
    Key? key,
    required this.iconName,
    required this.name,
    required this.route,
  }) : super(key: key);

  final String name;
  final String iconName;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      child: TextButton(
        onPressed: () {
          Routes.goToRoute(context, route);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/menu_icons/$iconName.png",
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Inter",
                  ),
                ),
              ],
            ),
            StatefullSwitch(),
          ],
        ),
      ),
    );
  }
}
