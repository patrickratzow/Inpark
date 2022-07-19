import "package:flutter/material.dart";
import "../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class TitleBar extends HookWidget {
  const TitleBar({
    super.key,
    required this.name,
    this.textScaleFactor,
  });

  final String name;
  final double? textScaleFactor;

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

    return Align(
      child: Text(
        name,
        textScaleFactor: textScaleFactor,
        textAlign: TextAlign.left,
        style: theme.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
