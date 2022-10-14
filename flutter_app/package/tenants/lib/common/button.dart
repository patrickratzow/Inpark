import 'package:flutter/material.dart';

class CustomButton {
  static Widget createButton(
      BuildContext context,
      String buttonText,
      Color textColor,
      Icon icon,
      Function()? onPressed,
      Color buttonBackground) {
    final bottomViewPadding = MediaQuery.of(context).viewPadding.bottom;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: 16,
          bottom: 16.0 + bottomViewPadding,
          left: 24,
          right: 24,
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: buttonBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: TextStyle(color: textColor),
                ),
                const SizedBox(width: 6),
                icon
              ],
            ),
          ),
        ),
      ),
    );
  }
}
