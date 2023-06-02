import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AppointmentItem(
          title: 'Today',
          subtitle: '18 patients',
          chart: Color(0xff0074ff),
        ),
        divider,
        const AppointmentItem(
          title: 'Canceled',
          subtitle: '7 patients',
          chart: Color(0xffff1759),
        )
      ],
    );
  }

  Widget get divider {
    return Flexible(
      flex: 1,
      child: SizedBox(
        width: 5,
        child: Container(
          alignment: Alignment.centerRight,
          height: 70,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                width: 1,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.chart,
  });

  final String title;
  final String subtitle;
  final Color chart;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 60,
              height: 80,
              child: CustomPaint(
                painter: CurrentDataChartPainter(chart),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 17, color: Colors.grey),
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
