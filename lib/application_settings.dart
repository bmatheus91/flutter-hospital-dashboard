import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_hospital_dashboard/routes.dart';

class ApplicationSettings extends Bloc<SettingsEvent, SettingsState> {
  String _currentRoute = ApplicationRoutes.home;

  ApplicationSettings() : super(IdleApplication()) {
    on<StartApplication>(_onStartApplication);
    on<UpdateCurrentRoute>(_setRoute);
  }

  String get currentRoute => _currentRoute;

  void _onStartApplication(
    StartApplication event,
    Emitter<SettingsState> emit,
  ) async {
    emit(InitializingApplication());

    await Future.delayed(const Duration(seconds: 2));

    emit(LoadedApplication());
  }

  void _setRoute(
    UpdateCurrentRoute event,
    Emitter<SettingsState> emit,
  ) {
    _currentRoute = event.route;
  }

  bool isRouteSelected(String route) => _currentRoute.startsWith(route);
}

abstract class SettingsEvent {}

class StartApplication extends SettingsEvent {}

class UpdateCurrentRoute extends SettingsEvent {
  UpdateCurrentRoute(this.route);

  final String route;
}

abstract class SettingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class IdleApplication extends SettingsState {}

class InitializingApplication extends SettingsState {}

class LoadedApplication extends SettingsState {}
