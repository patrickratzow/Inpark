import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../../../common/dashed_vertical_line.dart";
import "../../../common/half_circle_clipper.dart";
import "../../../generated_code/zooinator.models.swagger.dart";

class SpeakRow extends StatelessWidget {
  final SpeakDto speak;
  const SpeakRow({Key? key, required this.speak}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat("HH:mm");

    return CustomPaintBorder(formatter: formatter, speak: speak);
  }
}

class CustomPaintBorder extends StatelessWidget {
  const CustomPaintBorder({
    Key? key,
    required this.formatter,
    required this.speak,
  }) : super(key: key);

  final DateFormat formatter;
  final SpeakDto speak;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(radius: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 34,
              child: FittedBox(
                child: Text(
                  formatter.format(speak.start),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8),
          ),
          CustomPaint(
            size: const Size(1, 26),
            painter: DashedLineVerticalPainter(),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(speak.title),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: const BoxDecoration(
                    color: Color(0xffE4E8DE),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  child: const Text(
                    "Speak",
                    style: TextStyle(
                      fontSize: 11,
                      height: 16 / 11,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
