import 'package:flutter/material.dart';
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CalendarDay extends HookWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onPressed;

  const CalendarDay({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: isSelected ? CustomColor.green.middle : Colors.transparent,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: isSelected
                  ? const Color(0xffECFCE5)
                  : const Color(0xff0A0A0A),
            ),
          ),
        ),
      ),
    );
  }
}