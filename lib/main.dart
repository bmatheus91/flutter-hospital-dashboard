import 'package:flutter/material.dart';

import 'hospital_dashboard.dart';

Color primaryColor = const Color(0xff0074ff);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HospitalDashboard(title: 'Flutter Demo Home Page'),
    );
  }
}
