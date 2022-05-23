import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_app/features/animals/models/animal_area.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_svg/flutter_svg.dart";

class AnimalMap extends HookWidget {
  final List<AnimalArea> data;

  const AnimalMap({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InteractiveViewer(
      maxScale: 7,
      minScale: 1,
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/world.svg",
            width: width,
            alignment: Alignment.topCenter,
            color: Colors.grey,
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: AnimalAreaPainter(data),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimalAreaPainter extends CustomPainter {
  final List<AnimalArea> areas;

  AnimalAreaPainter(this.areas);

  @override
  void paint(Canvas canvas, Size size) {
    for (final area in areas) {
      final fillPaint =
          _createPaint(area.color.withOpacity(0.5), PaintingStyle.fill);
      _drawArea(area, fillPaint, canvas, size);
      final strokePaint = _createPaint(area.color, PaintingStyle.stroke);
      _drawArea(area, strokePaint, canvas, size);
    }
  }

  void _drawArea(AnimalArea area, Paint paint, Canvas canvas, Size size) {
    final path = Path();

    final startPos = _toScreenCoordinates(area.points[0], size);
    path.moveTo(startPos.dx, startPos.dy);
    for (int i = 1; i < area.points.length; i++) {
      final pos = _toScreenCoordinates(area.points[i], size);
      path.lineTo(pos.dx, pos.dy);
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  Paint _createPaint(Color color, PaintingStyle style) {
    return Paint()
      ..color = color
      ..strokeWidth = 0.1
      ..style = style
      ..strokeCap = StrokeCap.round;
  }

  Offset _toScreenCoordinates(Point point, Size size) {
    final x = point.x;
    final y = point.y;
    final screenX = (x / 100) * size.width;
    final screenY = (y / 100) * size.height;

    return Offset(screenX, screenY);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
