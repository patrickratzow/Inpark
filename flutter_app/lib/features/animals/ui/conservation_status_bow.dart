import 'package:flutter/material.dart';

class ConservationStatusBowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 129.5;
    final double _yScaling = size.height / 7.5;
    path.lineTo(130 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      130 * _xScaling,
      0 * _yScaling,
      130 * _xScaling,
      0 * _yScaling,
      130 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      130 * _xScaling,
      2.20914 * _yScaling,
      128.209 * _xScaling,
      4 * _yScaling,
      126 * _xScaling,
      4 * _yScaling,
    );
    path.cubicTo(
      126 * _xScaling,
      4 * _yScaling,
      91 * _xScaling,
      4 * _yScaling,
      91 * _xScaling,
      4 * _yScaling,
    );
    path.cubicTo(
      91 * _xScaling,
      4 * _yScaling,
      70.4409 * _xScaling,
      4 * _yScaling,
      70.4409 * _xScaling,
      4 * _yScaling,
    );
    path.cubicTo(
      69.512 * _xScaling,
      4 * _yScaling,
      68.6147 * _xScaling,
      4.33715 * _yScaling,
      67.9156 * _xScaling,
      4.94883 * _yScaling,
    );
    path.cubicTo(
      67.9156 * _xScaling,
      4.94883 * _yScaling,
      67.3839 * _xScaling,
      5.41409 * _yScaling,
      67.3839 * _xScaling,
      5.41409 * _yScaling,
    );
    path.cubicTo(
      66.0713 * _xScaling,
      6.56265 * _yScaling,
      64.0736 * _xScaling,
      6.41923 * _yScaling,
      62.9385 * _xScaling,
      5.09494 * _yScaling,
    );
    path.cubicTo(
      62.9385 * _xScaling,
      5.09494 * _yScaling,
      62.9385 * _xScaling,
      5.09494 * _yScaling,
      62.9385 * _xScaling,
      5.09494 * _yScaling,
    );
    path.cubicTo(
      62.3428 * _xScaling,
      4.39997 * _yScaling,
      61.4732 * _xScaling,
      4 * _yScaling,
      60.5579 * _xScaling,
      4 * _yScaling,
    );
    path.cubicTo(
      60.5579 * _xScaling,
      4 * _yScaling,
      44 * _xScaling,
      4 * _yScaling,
      44 * _xScaling,
      4 * _yScaling,
    );
    path.cubicTo(
      44 * _xScaling,
      4 * _yScaling,
      4 * _xScaling,
      4 * _yScaling,
      4 * _xScaling,
      4 * _yScaling,
    );
    path.cubicTo(
      2.067 * _xScaling,
      4 * _yScaling,
      0.5 * _xScaling,
      2.433 * _yScaling,
      0.5 * _xScaling,
      0.5 * _yScaling,
    );
    path.cubicTo(
      0.5 * _xScaling,
      0.5 * _yScaling,
      0.5 * _xScaling,
      0.5 * _yScaling,
      0.5 * _xScaling,
      0.5 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
