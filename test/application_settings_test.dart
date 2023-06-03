import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:flutter_hospital_dashboard/application_settings.dart';
import 'package:flutter_hospital_dashboard/routes.dart';

void main() {
  group('ApplicationSettings -', () {
    late ApplicationSettings settings;

    setUp(() {
      settings = ApplicationSettings();
    });

    test('Initial state must be IdleApplication', () {
      expect(settings.state, IdleApplication());
    });

    blocTest<ApplicationSettings, SettingsState>(
      'emits [InitializingApplication, LoadedApplication] when start application',
      build: () => settings,
      act: (bloc) => bloc.add(StartApplication()),
      wait: const Duration(seconds: 2),
      expect: () => <SettingsState>[
        InitializingApplication(),
        LoadedApplication(),
      ],
    );

    test('Initial route must be ${ApplicationRoutes.root}', () {
      expect(settings.currentRoute, equals(ApplicationRoutes.root));
    });

    test('Should update current location', () {
      settings.add(
        UpdateCurrentRoute(ApplicationRoutes.home),
      );

      expect(settings.currentRoute, equals(ApplicationRoutes.home));
    });

    blocTest<ApplicationSettings, SettingsState>(
      'emits [InitializingApplication, LoadedApplication] when start application',
      build: () => settings,
      act: (bloc) => bloc.add(StartApplication()),
      wait: const Duration(seconds: 2),
      expect: () => <SettingsState>[
        InitializingApplication(),
        LoadedApplication(),
      ],
    );
  });
}
