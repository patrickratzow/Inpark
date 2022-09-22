import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SidebarSectionHeader extends HookWidget {
  final String title;

  const SidebarSectionHeader(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: Color(0xff49454F),
            fontWeight: FontWeight.bold,
            height: (20 / 14),
            letterSpacing: 0.1,
          ),
        ),
      ),
    );
  }
}
