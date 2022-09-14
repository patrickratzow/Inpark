import 'package:flutter/material.dart';

class SidebarDivider extends StatelessWidget {
  const SidebarDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 1,
        color: const Color(0xff79747E),
      ),
    );
  }
}
