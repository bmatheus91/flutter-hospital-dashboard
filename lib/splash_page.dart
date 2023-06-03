import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hospital_dashboard/application_settings.dart';

import 'routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ApplicationSettings, SettingsState>(
        bloc: context.read<ApplicationSettings>()..add(StartApplication()),
        listener: (context, state) {
          if (state is LoadedApplication) {
            Navigator.pushReplacementNamed(context, ApplicationRoutes.home);
          }
        },
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
