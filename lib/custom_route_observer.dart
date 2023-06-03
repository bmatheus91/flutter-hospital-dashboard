import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hospital_dashboard/routes.dart';

import 'application_settings.dart';

class CustomRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  CustomRouteObserver({this.routePrefix});

  final String? routePrefix;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    if (route is PageRoute) {
      final screenName = routePrefix == null
          ? route.settings.name
          : '$routePrefix${route.settings.name}';

      log('Going to: $screenName');

      route.navigator?.context
          .read<ApplicationSettings>()
          .add(UpdateCurrentRoute(screenName ?? ApplicationRoutes.notFound));
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    if (newRoute is PageRoute) {
      final screenName = routePrefix == null
          ? newRoute.settings.name
          : '$routePrefix${newRoute.settings.name}';

      newRoute.settings.name;
      log('Replacing ${oldRoute?.settings.name} for: $screenName');
      newRoute.navigator?.context
          .read<ApplicationSettings>()
          .add(UpdateCurrentRoute(screenName ?? ApplicationRoutes.notFound));
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    if (previousRoute is PageRoute && route is PageRoute) {
      final screenName = routePrefix == null
          ? previousRoute.settings.name
          : '$routePrefix${previousRoute.settings.name}';

      log('Going from ${route.settings.name} to: $screenName');
      previousRoute.navigator?.context
          .read<ApplicationSettings>()
          .add(UpdateCurrentRoute(screenName ?? ApplicationRoutes.notFound));
    }
  }
}
