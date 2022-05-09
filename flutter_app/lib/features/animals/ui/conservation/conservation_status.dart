import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_app/features/animals/models/iucn_status.dart";
import "package:flutter_app/generated_code/zooinator.enums.swagger.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class ConservationStatus extends HookWidget {
  final IUCNStatusDto activeStatus;

  const ConservationStatus({
    Key? key,
    required this.activeStatus,
  }) : super(key: key);

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Bevaringsstatus",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff698665),
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(width: 2),
                Padding(
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
              ..._buildExtinctSection(),
              const SizedBox(width: 12),
              _buildThreatenedSection(),
              const SizedBox(width: 12),
              ..._buildLeastConcernedSection(),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildExtinctSection() {
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
          const Text(
            "Uddød",
            style: TextStyle(color: Color(0xff698665)),
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

  Widget _buildThreatenedSection() {
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
          child: Image.asset("assets/bow_connector.png"),
        ),
        const Text(
          "Truet",
          style: TextStyle(color: Color(0xff698665)),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  List<Widget> _buildLeastConcernedSection() {
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
          const Text(
            "Ikke \nTruet",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff698665),
            ),
          )
        ],
      )
    ];
  }
}

class ConservationCircle extends StatelessWidget {
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
              style: TextStyle(
                color: textColor,
                height: 16 / 12,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
