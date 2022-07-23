import "package:flutter/material.dart";
import "package:flutter_app/hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class SettingsTitleBar extends HookWidget {
  final String name;

  const SettingsTitleBar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: Align(
        child: Text(
          name,
          textAlign: TextAlign.left,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 1.0,
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
