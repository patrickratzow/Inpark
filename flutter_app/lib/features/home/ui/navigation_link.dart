import "package:flutter/material.dart";
import "package:flutter_custom_tabs/flutter_custom_tabs.dart";

import "../../../common/colors.dart";
import "../../../routes.dart";

class NavigationLink extends StatelessWidget {
  const NavigationLink({
    Key? key,
    required this.iconName,
    required this.text,
    this.route,
    this.onPressed,
  }) : super(key: key);

  final String iconName;
  final String text;
  final String? route;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        children: [
          GestureDetector(
            onTap: onPressed ??
                () {
                  Routes.goToRoute(context, route!);
                },
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColor.green.icon,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/menu_icons/$iconName.png",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 3),
          SizedBox(
            width: 64,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: "Poppins",
              ),
              textScaleFactor: 1,
            ),
          )
        ],
      ),
    );
  }
}
