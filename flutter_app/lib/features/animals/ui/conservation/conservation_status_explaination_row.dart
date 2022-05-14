import "package:flutter/material.dart";
import "package:flutter_app/features/animals/models/iucn_status.dart";
import "package:flutter_app/generated_code/zooinator.enums.swagger.dart";

import "conservation_status.dart";

class ConservationStatusExplainationRow extends StatelessWidget {
  final IUCNStatusDto status;
  final bool highlight;

  const ConservationStatusExplainationRow({
    super.key,
    required this.status,
    required this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    const opacity = 0.6;
    var statusColor = ucnStatusColorMap[status]!;
    var containerColor = highlight
        ? statusColor.color.withOpacity(opacity)
        : const Color(0xffF5F5F5);
    var containerTextColor = highlight
        ? (ThemeData.estimateBrightnessForColor(containerColor) ==
                Brightness.light
            ? Colors.black
            : Colors.white)
        : Colors.black.withOpacity(0.46);
    highlight
        ? statusColor.color.withOpacity(opacity)
        : const Color(0xffF5F5F5);
    var headerColor = highlight
        ? statusColor.color.withOpacity(opacity)
        : const Color(0xffDEDEDE);
    var headerTextColor = highlight
        ? (ThemeData.estimateBrightnessForColor(headerColor) == Brightness.light
            ? Colors.black
            : Colors.white)
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
                    text: status.name.toUpperCase(),
                    color: statusColor.color,
                    textColor: statusColor.textColor,
                    active: highlight,
                    disabledOpacity: 0.6,
                  ),
                ),
                Text(
                  statusColor.name,
                  style: TextStyle(
                    color: headerTextColor,
                    fontSize: 14,
                    height: 18 / 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Text(
              statusColor.description,
              softWrap: true,
              style: TextStyle(
                color: containerTextColor,
                fontSize: 11,
                height: 18 / 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
