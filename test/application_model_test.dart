import 'package:flutter_hospital_dashboard/application_settings.dart';
import 'package:flutter_hospital_dashboard/routes.dart';
import 'package:test/test.dart';

void main() {
  test('Initial route must be ${ApplicationRoutes.home}', () {
    final application = ApplicationSettings();

    expect(application.currentRoute, equals(ApplicationRoutes.home));
  });
}
