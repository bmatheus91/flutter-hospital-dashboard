import 'package:flutter/material.dart';

class HealthInformationCard extends StatelessWidget {
  const HealthInformationCard({
    super.key,
    required this.title,
    required this.value,
    required this.measurement,
    required this.color,
    required this.icon,
  });

  final Color color;
  final Widget icon;
  final String title;
  final String value;
  final String measurement;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        elevation: 3,
        color: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: color,
                  shape: const CircleBorder(
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                child: icon,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                measurement,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
