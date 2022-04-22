import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../../../common/dashed_vertical_line.dart";
import "../../../common/half_circle_clipper.dart";
import '../../../common/ui/custom_rectangle_border.dart';
import "../../../generated_code/zooinator.models.swagger.dart";

class SpeakRow extends StatelessWidget {
  final SpeakDto speak;
  const SpeakRow({Key? key, required this.speak}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat("HH:mm");

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 50,
            decoration: ShapeDecoration(
              shape: CustomRoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.zero,
                ),
                topSide: BorderSide(color: Colors.red),
                topLeftCornerSide: BorderSide(color: Colors.red),
                topRightCornerSide: BorderSide(color: Colors.red),
                leftSide: BorderSide(color: Colors.red),
                rightSide: BorderSide(width: 0, color: Colors.transparent),
                bottomSide: BorderSide(color: Colors.red),
                bottomLeftCornerSide: BorderSide(color: Colors.red),
                bottomRightCornerSide: BorderSide(color: Colors.red),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: FittedBox(
                child: Text(
                  formatter.format(speak.start),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
            child: ClipPath(
              clipper: DolDurmaClipper(radius: 8),
              child: Container(
                height: 34,
                child: CustomPaint(
                  painter: MyPainter(radius: 15),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(speak.title),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffE4E8DE),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: const Text("Speak"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
