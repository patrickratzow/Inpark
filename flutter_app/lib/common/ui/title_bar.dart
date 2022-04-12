import "package:flutter/material.dart";

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Align(
        child: Text(
          name,
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
          ),
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
