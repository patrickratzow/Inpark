import "package:flutter/material.dart";
import "../../models/iucn_status.dart";
import "../../../../generated_code/zooinator.enums.swagger.dart";
import "../../../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "conservation_status.dart";

class ConservationStatusExplainationRow extends HookWidget {
  static const double opacity = 0.6;
  final IUCNStatus status;
  final bool highlight;

  ConservationStatusExplainationRow({
    super.key,
    required IUCNStatusDto status,
    required this.highlight,
  }) : status = ucnStatusColorMap[status]!;

  Color brightnessCorrect(Color darkColor, Color lightColor) {
    final headerColor =
        highlight ? status.color.withOpacity(opacity) : const Color(0xffDEDEDE);

    return ThemeData.estimateBrightnessForColor(headerColor) == Brightness.light
        ? darkColor
        : lightColor;
  }

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();
    final containerColor =
        highlight ? status.color.withOpacity(opacity) : const Color(0xffF5F5F5);
    final containerTextColor = highlight
        ? brightnessCorrect(Colors.black, Colors.white)
        : Colors.black.withOpacity(0.46);
    final headerColor =
        highlight ? status.color.withOpacity(opacity) : const Color(0xffDEDEDE);
    final headerTextColor = highlight
        ? brightnessCorrect(Colors.black, Colors.white)
        : Colors.black.withOpacity(0.46);

    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: headerColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4),
                topLeft: Radius.circular(4),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConservationCircle(
                    text: status.code,
                    color: status.color,
                    textColor: status.textColor,
                    active: highlight,
                    disabledOpacity: 0.6,
                  ),
                ),
                Text(
                  status.name,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: headerTextColor,
                    height: 18 / 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Text(
              status.description,
              softWrap: true,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: containerTextColor,
                height: 18 / 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
