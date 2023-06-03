import 'package:flutter/material.dart';

import 'dart:math';

import 'package:path_drawing/path_drawing.dart';

class ChartPainter extends CustomPainter {
  ChartPainter(this.parentContext, this.values);

  final backgroundPaint = Paint()
    ..color = const Color(0xff4298ff)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 2;

  final highlightedPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4;

  final valuePaintOpacity = Paint()
    ..color = Colors.white.withOpacity(0.3)
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4;

  final List<double> values;
  final BuildContext parentContext;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path();
    final highlightedPath = Path();
    final valuePath = Path();

    final jump = jumpInterval(parentContext);

    final smallestValue = values.reduce(min);
    final largestValue = values.reduce(max);

    for (var i = 1; i < values.length; i++) {
      if (i % 2 != 0) {
        backgroundPath.moveTo(jump * i, 0);
        backgroundPath.lineTo(jump * i, size.height);
      }

      if (values[i] == largestValue || values[i] == smallestValue) {
        highlightedPath.moveTo(jump * i, size.height);
        highlightedPath.lineTo(jump * i, values[i] + size.height * 0.25);
        continue;
      }

      valuePath.moveTo(jump * i, size.height);
      valuePath.lineTo(jump * i, values[i] + size.height * 0.25);
    }

    canvas.drawPath(
      dashPath(
        backgroundPath,
        dashArray: CircularIntervalList([3, 6]),
      ),
      backgroundPaint,
    );

    canvas.drawPath(valuePath, valuePaintOpacity);
    canvas.drawPath(highlightedPath, highlightedPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  double jumpInterval(BuildContext context) {
    return (MediaQuery.of(context).size.width * .9) / values.length;
  }
}
