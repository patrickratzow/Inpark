import "package:flutter/material.dart";
import "../../../../common/colors.dart";
import "../../models/animals_model.dart";
import "../../../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class AnimalsCategories extends HookWidget {
  const AnimalsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final model = useProvider<AnimalsModel>(watch: true);

    return Row(
      children: [
        const SizedBox(width: 8),
        ...model.categories
            .map(
              (x) => _CategoryButton(
                categoryName: x.name,
                enabled: x.enabled,
                onPressed: () {
                  model.toggleCategory(x, context);
                },
              ),
            )
            .cast<Widget>()
            .toList(),
      ],
    );
  }
}

class _CategoryButton extends HookWidget {
  final String categoryName;
  final bool enabled;
  final VoidCallback onPressed;

  const _CategoryButton({
    super.key,
    required this.enabled,
    required this.categoryName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 36 * MediaQuery.of(context).textScaleFactor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            backgroundColor:
                enabled ? CustomColor.green.middle : const Color(0xffEEF2EE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: enabled
                  ? BorderSide.none
                  : BorderSide(color: CustomColor.green.darkest),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            categoryName,
            style: theme.textTheme.bodyLarge?.copyWith(
              height: 16 / 14,
              color: enabled
                  ? CustomColor.green.lightest
                  : CustomColor.green.darkest,
            ),
          ),
        ),
      ),
    );
  }
}
