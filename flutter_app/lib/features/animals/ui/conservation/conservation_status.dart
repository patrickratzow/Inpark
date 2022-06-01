import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "../../models/iucn_status.dart";
import "../../../../generated_code/zooinator.enums.swagger.dart";
import "../../../../hooks/hooks.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class ConservationStatus extends HookWidget {
  final IUCNStatusDto activeStatus;

  const ConservationStatus({
    super.key,
    required this.activeStatus,
  });

  Widget _buildConservationCircle(IUCNStatusDto status) {
    var color = ucnStatusColorMap[status]!;
    return ConservationCircle(
      text: describeEnum(status).toUpperCase(),
      color: color.color,
      textColor: color.textColor,
      active: status == activeStatus,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bevaringsstatus",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: const Color(0xff698665),
                  ),
                ),
                const SizedBox(width: 2),
                const Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Icon(
                    Icons.info_outlined,
                    size: 16,
                    color: Color(0xff698665),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._buildExtinctSection(theme),
              const SizedBox(width: 12),
              _buildThreatenedSection(theme),
              const SizedBox(width: 12),
              ..._buildLeastConcernedSection(theme),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildExtinctSection(ThemeData theme) {
    return [
      Column(
        children: [
          _buildConservationCircle(IUCNStatusDto.ex),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 2),
            child: Container(
              color: const Color(0xff698665),
              child: const SizedBox(
                width: 1,
                height: 10,
              ),
            ),
          ),
          Text(
            "Uddød",
            style: theme.textTheme.bodyLarge?.copyWith(
              color: const Color(0xff698665),
            ),
          )
        ],
      ),
      const SizedBox(width: 12),
      Column(
        children: [
          _buildConservationCircle(IUCNStatusDto.ew),
        ],
      ),
    ];
  }

  Widget _buildThreatenedSection(ThemeData theme) {
    return Column(
      children: [
        Row(
          children: [
            _buildConservationCircle(IUCNStatusDto.cr),
            const SizedBox(width: 12),
            _buildConservationCircle(IUCNStatusDto.en),
            const SizedBox(width: 12),
            _buildConservationCircle(IUCNStatusDto.vu)
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 5),
          child: SvgPicture.asset(
            "assets/bow_connector.svg",
          ),
        ),
        Text(
          "Truet",
          style: theme.textTheme.bodyLarge?.copyWith(
            color: const Color(0xff698665),
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  List<Widget> _buildLeastConcernedSection(ThemeData theme) {
    return [
      Column(
        children: [
          _buildConservationCircle(IUCNStatusDto.nt),
        ],
      ),
      const SizedBox(width: 12),
      Column(
        children: [
          _buildConservationCircle(IUCNStatusDto.lc),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 0, 2),
            child: Container(
              color: const Color(0xff698665),
              child: const SizedBox(
                width: 1,
                height: 10,
              ),
            ),
          ),
          Text(
            "Ikke \nTruet",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: const Color(0xff698665),
            ),
          )
        ],
      )
    ];
  }
}

class ConservationCircle extends HookWidget {
  final String text;
  final Color color;
  final Color textColor;
  final bool active;
  final double? disabledOpacity;

  const ConservationCircle({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.active,
    this.disabledOpacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = useTheme();

    return Opacity(
      opacity: active ? 1 : (disabledOpacity ?? 0.25),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: FittedBox(
          child: Center(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: textColor,
                height: 16 / 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
