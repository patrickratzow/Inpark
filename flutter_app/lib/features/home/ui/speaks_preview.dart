import "package:flutter/material.dart";
import "package:flutter_app/features/home/models/speak_model.dart";
import "package:flutter_app/generated_code/zooinator.models.swagger.dart";
import "package:provider/provider.dart";
import 'package:intl/intl.dart';
import "../../../common/ui/title_bar.dart";

class SpeaksPreview extends StatelessWidget {
  const SpeaksPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SpeakModel>().fetchSpeaksForToday();

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const TitleBar(
            fontSize: 16,
            name: "Aktiviteter & Speaks:",
          ),
          Consumer<SpeakModel>(
            builder: (context, value, child) {
              if (value.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (value.error.isNotEmpty) {
                return const Center(
                  child: Text("Der er ingen speaks i dag"),
                );
              }

              /*
              var speaks = value.topThreeSpeaks;
              if (speaks.isEmpty) {
                return const Center(
                  child: Text("Alle speaks for i dag er ovre :)"),
                );
              }*/

              return Column(
                children: value.speaks
                    .map(
                      (s) => _buildSpeakRow(s),
                    )
                    .toList(),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
          ),
        ],
      ),
    );
  }

  Widget _buildSpeakRow(SpeakDto s) {
    final DateFormat formatter = DateFormat("HH:mm");

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xfff7f7f7),
          width: 1.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 34,
              child: FittedBox(
                child: Text(
                  formatter.format(s.start),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            CustomPaint(
              size: Size(1, 20),
              painter: DashedLineVerticalPainter(),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(s.title),
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
      ),
    );
  }
}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 3, dashSpace = 2, startY = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

//idk om det skal beholdes eller fjernes senere
class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper({required this.right, required this.holeRadius});

  final double right;
  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - right - holeRadius, 0.0)
      ..arcToPoint(
        Offset(size.width - right, 0),
        clockwise: false,
        radius: Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right, size.height)
      ..arcToPoint(
        Offset(size.width - right - holeRadius, size.height),
        clockwise: false,
        radius: Radius.circular(1),
      );

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}
