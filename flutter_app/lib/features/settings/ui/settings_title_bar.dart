import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class SettingsTitleBar extends StatelessWidget {
  const SettingsTitleBar({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: Align(
        child: Text(
          name,
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
