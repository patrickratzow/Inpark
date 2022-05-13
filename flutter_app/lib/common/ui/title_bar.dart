import "package:flutter/material.dart";
import "package:flutter_app/hooks/use_theme.dart";
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
        style: theme.textTheme.headline4,
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
