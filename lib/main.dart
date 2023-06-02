import 'package:flutter/material.dart';
import 'package:flutter_hospital_dashboard/patient_dashboard_page.dart';
import 'package:flutter_hospital_dashboard/routes.dart';

import 'home/home_screen.dart';
import 'hospital_dashboard.dart';
import 'settings/settings_screen.dart';
import 'setup/setup_flow.dart';

Color primaryColor = const Color(0xff0074ff);
typedef RouteConfiguration = Route<dynamic>? Function(RouteSettings)?;
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
      onGenerateRoute: onGenerateRoute(),
    );
  }

  RouteConfiguration onGenerateRoute() => (settings) {
        late Widget page;

        if (settings.name == ApplicationRoutes.home) {
          page = const HospitalDashboard();
        } else if (settings.name!.startsWith(ApplicationRoutes.patient)) {
          page = const PatientDashboardPage();
        } else if (settings.name == ApplicationRoutes.settings) {
          page = const SettingsScreen();
        } else if (settings.name!.startsWith(ApplicationRoutes.prefixSetup)) {
          final nestedRoute =
              settings.name!.substring(ApplicationRoutes.prefixSetup.length);

          page = SetupFlow(route: nestedRoute);
        } else {
          throw Exception('Unknown route: ${settings.name}');
        }

        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      };
}
