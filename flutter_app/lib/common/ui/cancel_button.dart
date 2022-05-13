import "package:flutter/material.dart";

import "package:flutter_app/common/colors.dart";
import "package:flutter_app/hooks/use_provider.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class CancelButton extends HookWidget {
  final VoidCallback onPressed;

  const CancelButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final policies = usePolicies();

    if (policies.showCancelButtonAsText) {
      return TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
        ),
        onPressed: onPressed,
        child: Text(
          "Cancel",
          style: TextStyle(
            fontSize: 16,
            color: CustomColor.green.middle,
          ),
        ),
      );
    }

    return IconButton(
      icon: Icon(
        Icons.close,
        color: CustomColor.green.middle,
        size: 28,
      ),
      onPressed: onPressed,
    );
  }
}
