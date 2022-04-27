import "package:flutter/material.dart";

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key? key,
    required this.name,
    required this.fontSize,
    this.color,
    this.height,
  }) : super(key: key);

  final String name;
  final double fontSize;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: color ?? Colors.black,
          fontSize: fontSize,
          height: height ?? 1,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins",
        ),
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
