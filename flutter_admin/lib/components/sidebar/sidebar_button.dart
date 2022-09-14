import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SidebarButton extends HookWidget {
  final Function() onPressed;
  final Widget? leading;
  final String text;
  final Widget? trailing;
  final bool isActive;

  const SidebarButton({
    super.key,
    required this.onPressed,
    this.leading,
    required this.text,
    this.trailing,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    const onColor = Color(0xffE8DEF8);
    final offColor = onColor.withOpacity(0);
    final initialActive = useState(isActive);

    const textColor = Color(0xff1D192B);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    var beginColor = initialActive.value ? onColor : offColor;
    var endColor = initialActive.value ? offColor : onColor;

    final animation = ColorTween(
      begin: beginColor,
      end: endColor,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.decelerate,
      ),
    );

    useValueChanged<bool, void>(isActive, (newValue, _) {
      if (newValue) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    });

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SizedBox(
          height: 56,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: animation.value,
            ),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
              child: Row(
                children: [
                  if (leading != null) ...[
                    leading!,
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            height: (20 / 14),
                            letterSpacing: 0.1,
                          ),
                        ),
                        if (trailing != null) trailing!
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
