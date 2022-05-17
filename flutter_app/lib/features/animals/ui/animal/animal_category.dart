import "package:flutter/widgets.dart";
import "../../../../common/colors.dart";
import "../../../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class AnimalCategory extends HookWidget {
  final String text;
  final EdgeInsets padding;
  final double fontSize;

  const AnimalCategory({
    super.key,
    required this.text,
    required this.padding,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

    return Container(
      decoration: BoxDecoration(
        color: CustomColor.green.lightest,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: padding,
      child: Text(
        text,
        style: theme.textTheme.bodyLarge?.copyWith(
          height: (fontSize - 0.5) / fontSize,
          fontSize: fontSize,
          color: CustomColor.green.darkest,
        ),
      ),
    );
  }
}
