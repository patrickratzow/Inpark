import "package:flutter/material.dart";
import "dart:io" show Platform;

class CancelButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CancelButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Platform.isAndroid
          ? const Icon(
              Icons.cancel,
            )
          : const Text(
              "Cancel",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff090a0a),
              ),
            ),
    );
  }
}
