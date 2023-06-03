import 'package:flutter/material.dart';

import '../routes.dart';

Color primaryColor = const Color(0xff0074ff);

class PatientAppointmentSummaryCard extends StatelessWidget {
  const PatientAppointmentSummaryCard({
    super.key,
    this.isActive = false,
    required this.id,
    required this.name,
    required this.hour,
  });

  final bool isActive;
  final String id;
  final String name;
  final String hour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ApplicationRoutes.patient);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: isActive ? primaryColor : Colors.white,
        ),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Avatar(width: 40, height: 40),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListTile(
                    title: Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(id),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    hour,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.check_circle,
                      size: 30,
                      color: Color(0xff26e56d),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.cancel,
                      size: 30,
                      color: Color(0xffff4077),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.width,
    required this.height,
    this.url,
  });

  final double height;
  final double width;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage(url ?? 'https://api.dicebear.com/6.x/bottts/png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
