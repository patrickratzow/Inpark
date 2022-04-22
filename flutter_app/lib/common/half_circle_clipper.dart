import 'package:flutter/material.dart';

class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper({
    required this.radius,
  });

  final double radius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(
        Offset(size.width, 0),
        clockwise: false,
        radius: Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height)
      ..arcToPoint(
        Offset(size.width - radius, size.height),
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

class MyPainter extends CustomPainter {
  double radius;

  MyPainter({required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..arcToPoint(
        Offset(size.width, 0),
        clockwise: false,
        radius: const Radius.circular(1),
      )
      ..moveTo(size.width, 0)
      ..moveTo(size.width, size.height)
      ..arcToPoint(
        Offset(0, size.height),
        clockwise: false,
        radius: const Radius.circular(1),
      )
      ..moveTo(0, size.height);

    path.close();

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.red;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
