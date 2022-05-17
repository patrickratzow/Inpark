import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../../hooks/hooks.dart";

class SettingRow extends HookWidget {
  const SettingRow({
    super.key,
    required this.leading,
    required this.name,
    required this.trailing,
    this.onPressed,
  });

  final String name;
  final Widget leading;
  final Widget trailing;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

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
                  child: leading,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  name,
                  style: theme.textTheme.headlineSmall,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: trailing,
            ),
          ],
        ),
      ),
    );
  }
}
