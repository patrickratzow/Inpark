import "package:flutter/material.dart";
import "package:flutter_app/common/colors.dart";
import "package:flutter_hooks/flutter_hooks.dart";

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
    var controller = useAnimationController();
    useValueChanged(isSelected, (bool oldValue, oldResult) {
      return controller.animateTo(
        isSelected ? 1 : 0,
        duration: const Duration(milliseconds: 50),
      );
    });

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onTap: onPressed,
          child: Container(
            // Hack to make hitbox of container not be circular
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.zero,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color.lerp(
                  Colors.transparent,
                  CustomColor.green.middle,
                  controller.value,
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.lerp(
                      const Color(0xff0A0A0A),
                      const Color(0xffECFCE5),
                      controller.value,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
