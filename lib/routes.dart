import 'package:flutter/material.dart';

typedef RouteConfiguration<T> = Route<T>? Function(RouteSettings)?;

class ApplicationRoutes {
  // Home
  static const home = '/';

  // Settings
  static const settings = '/settings';

  // Patient
  static const patient = '/patient';

  // Setup
  static const prefixSetup = '/setup/';
  static const setupStart = '/setup/$setupStartPage';
  static const setupStartPage = 'find_devices';
  static const setupSelectDevicePage = 'select_device';
  static const setupConnectingPage = 'connecting';
  static const setupFinishedPage = 'finished';
}
