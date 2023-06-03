import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hospital_dashboard/patient/patient_dashboard.dart';
import 'package:flutter_hospital_dashboard/routes.dart';
import 'package:flutter_hospital_dashboard/splash_page.dart';
import 'package:provider/provider.dart';

import 'application_settings.dart';
import 'custom_route_observer.dart';
import 'hospital/hospital_dashboard.dart';
import 'settings/settings_screen.dart';
import 'setup/setup_flow.dart';
import 'widgets/custom_bottom_app_bar.dart';

Color primaryColor = const Color(0xff0074ff);
typedef RouteConfiguration = Route<dynamic>? Function(RouteSettings)?;
void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  Application({super.key});

  final pageController = PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ApplicationSettings(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorObservers: [CustomRouteObserver()],
        onGenerateRoute: onGenerateRoute(),
      ),
    );
  }

  RouteConfiguration onGenerateRoute() => (settings) {
        late Widget page;
        if (settings.name == ApplicationRoutes.root) {
          page = const SplashPage();
        } else if (settings.name == ApplicationRoutes.home) {
          page = const HospitalDashboard();
        } else if (settings.name == ApplicationRoutes.patient) {
          page = const PatientDashboard();
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
