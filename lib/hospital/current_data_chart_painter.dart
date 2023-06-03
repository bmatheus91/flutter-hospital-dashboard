import 'package:flutter/material.dart';

class CurrentDataChartPainter extends CustomPainter {
  CurrentDataChartPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final trackBarPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    final trackBarPaintOpacity = Paint()
      ..color = color.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    final trackBarPath = Path();
    final trackBarPathOpacity = Path();

    final values = [
      size.height * 0.3,
      size.height * 0.4,
      size.height * 0.7,
      size.height * 0.15,
      size.height * 0.35,
    ];

    double origin = 10;

    for (var i = 0; i < values.length; i++) {
      if (i != 3) {
        trackBarPathOpacity.moveTo(origin, size.height);
        trackBarPathOpacity.lineTo(origin, values[i]);
      } else {
        trackBarPath.moveTo(origin, size.height);
        trackBarPath.lineTo(origin, values[i]);
      }

      origin = origin + size.width * 0.15;
    }

    canvas.drawPath(trackBarPath, trackBarPaint);
    canvas.drawPath(trackBarPathOpacity, trackBarPaintOpacity);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
