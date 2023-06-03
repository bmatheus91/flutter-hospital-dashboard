import 'package:flutter/material.dart';
import 'package:flutter_hospital_dashboard/routes.dart';

import '../custom_route_observer.dart';
import '../widgets/custom_bottom_app_bar.dart';
import 'finished_page.dart';
import 'select_device_page.dart';
import 'waiting_page.dart';

class SetupFlow extends StatefulWidget {
  const SetupFlow({super.key, required this.route});

  final String route;

  @override
  State<SetupFlow> createState() => _SetupFlowState();
}

class _SetupFlowState extends State<SetupFlow> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _isExitDesired,
      child: Scaffold(
        appBar: _buildFlowAppBar(),
        body: Navigator(
          key: _navigatorKey,
          observers: [
            CustomRouteObserver(routePrefix: ApplicationRoutes.prefixSetup)
          ],
          initialRoute: widget.route,
          onGenerateRoute: onGenerateRoute(),
        ),
        bottomNavigationBar: const CustomBottomAppBar(),
      ),
    );
  }

  PreferredSizeWidget _buildFlowAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: _onExitPressed,
        icon: const Icon(Icons.chevron_left),
      ),
      title: const Text('Device Setup'),
    );
  }

  Future<void> _onExitPressed() async {
    final isConfirmed = await _isExitDesired();

    if (isConfirmed && mounted) {
      _exitSetup();
    }
  }

  Future<bool> _isExitDesired() async {
    return await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text(
                    'If you exit device setup, your progress will be lost.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Leave'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Stay'),
                  ),
                ],
              );
            }) ??
        false;
  }

  RouteConfiguration onGenerateRoute() => (settings) {
        late Widget page;

        switch (settings.name) {
          case ApplicationRoutes.setupStartPage:
            page = WaitingPage(
              message: 'Searching for nearby device...',
              onWaitComplete: _onDiscoveryComplete,
            );
            break;
          case ApplicationRoutes.setupSelectDevicePage:
            page = SelectDevicePage(
              onDeviceSelected: _onDeviceSelected,
            );
            break;
          case ApplicationRoutes.setupConnectingPage:
            page = WaitingPage(
              message: 'Connecting...',
              onWaitComplete: _onConnectionEstablished,
            );
            break;
          case ApplicationRoutes.setupFinishedPage:
            page = FinishedPage(
              onFinishPressed: _exitSetup,
            );
            break;
        }

        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      };

  void _exitSetup() {
    Navigator.of(context).pop();
  }

  void _onDiscoveryComplete() {
    _navigatorKey.currentState!
        .pushNamed(ApplicationRoutes.setupSelectDevicePage);
  }

  void _onDeviceSelected(String deviceId) {
    _navigatorKey.currentState!
        .pushNamed(ApplicationRoutes.setupConnectingPage);
  }

  void _onConnectionEstablished() {
    _navigatorKey.currentState!.pushNamed(ApplicationRoutes.setupFinishedPage);
  }
}
