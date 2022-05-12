import "package:flutter/material.dart";
import "dart:math";

class SpeakRowClipper extends CustomPainter {
  double radius;

  SpeakRowClipper({required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    double fromLeft = 60;

    final path = Path()
      ..moveTo(0, 0)
      ..arcTo(
        Rect.fromPoints(
          size.topLeft(Offset(0, radius)),
          size.topLeft(Offset(radius, 0)),
        ),
        pi * 1,
        pi * 0.5,
        true,
      )
      ..lineTo(fromLeft - 4, 0)
      //Here we make the half circle
      ..arcToPoint(
        Offset(fromLeft, 0),
        clockwise: false,
        radius: const Radius.circular(1),
      )
      ..arcTo(
        Rect.fromPoints(
          size.topRight(Offset(-radius, 0)),
          size.topRight(Offset(0, radius)),
        ),
        pi * 1.5,
        pi * 0.5,
        false,
      )
      ..arcTo(
        Rect.fromPoints(
          size.bottomRight(Offset(0, -radius)),
          size.bottomRight(Offset(-radius, 0)),
        ),
        pi * 0,
        pi * 0.5,
        false,
      )
      ..lineTo(fromLeft, size.height)
      ..arcToPoint(
        Offset(fromLeft - 4, size.height),
        clockwise: false,
        radius: const Radius.circular(1),
      )
      ..arcTo(
        Rect.fromPoints(
          size.bottomLeft(Offset(radius, 0)),
          size.bottomLeft(Offset(0, -radius)),
        ),
        pi * 0.5,
        pi * 0.5,
        false,
      )
      ..close();

    /*
      ..lineTo(size.width - right - radius, 0)
      //Here we make the half circle
      ..arcToPoint(
        Offset(size.width - right, 0),
        clockwise: false,
        radius: const Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right, size.height)
      ..arcToPoint(
        Offset(size.width - right - radius, size.height),
        clockwise: false,
        radius: const Radius.circular(1),
      )
      ..lineTo(0.0, size.height);
      */

    path.close();

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = const Color(0xffF6F6F6);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
