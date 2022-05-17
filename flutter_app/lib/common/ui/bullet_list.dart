import "package:flutter/material.dart";
import "../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class BulletList extends HookWidget {
  final List<Widget> children;

  const BulletList({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children.map((child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\u2022",
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.35,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: child,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
