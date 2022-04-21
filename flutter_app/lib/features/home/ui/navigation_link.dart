import "package:flutter/material.dart";

import '../../../common/colors.dart';
import '../../../routes.dart';

class NavigationLink extends StatelessWidget {
  const NavigationLink({
    Key? key,
    required this.iconName,
    required this.text,
    required this.route,
  }) : super(key: key);

  final String iconName;
  final String text;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: TextButton(
              onPressed: () {
                Routes.goToRoute(context, route);
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
            child: SizedBox(
              width: 64,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
