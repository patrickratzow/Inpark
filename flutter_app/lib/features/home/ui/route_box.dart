import "package:flutter/material.dart";

import '../../../routes.dart';

class RouteBox extends StatelessWidget {
  final String route;
  final String title;
  final String description;
  final String iconName;

  const RouteBox({
    Key? key,
    required this.route,
    required this.title,
    required this.description,
    required this.iconName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 5, 16, 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(
          color: const Color.fromARGB(255, 236, 236, 236),
        ),
      ),
      child: Material(
        elevation: 1,
        child: TextButton(
          onPressed: () {
            Routes.goToRoute(context, route);
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 102, 102, 102),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
