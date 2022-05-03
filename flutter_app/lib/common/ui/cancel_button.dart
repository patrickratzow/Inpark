import "package:flutter/material.dart";
import "dart:io" show Platform;

import 'package:flutter_app/common/colors.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CancelButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return IconButton(
        icon: Icon(
          Icons.close,
          color: CustomColor.green.middle,
          size: 28,
        ),
        onPressed: onPressed,
      );
    } else {
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
  }
}
