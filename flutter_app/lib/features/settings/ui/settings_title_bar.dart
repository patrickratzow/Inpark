import "package:flutter/material.dart";

class SettingsTitleBar extends StatelessWidget {
  const SettingsTitleBar({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Inter",
        ),
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
