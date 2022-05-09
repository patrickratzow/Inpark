import "package:flutter/material.dart";

class SettingRow extends StatelessWidget {
  const SettingRow({
    Key? key,
    required this.iconName,
    required this.name,
    required this.widget,
    this.onPressed,
  }) : super(key: key);

  final String name;
  final String iconName;
  final Widget widget;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Image.asset(
                    "assets/menu_icons/$iconName.png",
                  ),
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
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: widget,
            ),
          ],
        ),
      ),
    );
  }
}
