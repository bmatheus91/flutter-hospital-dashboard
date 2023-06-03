import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application_settings.dart';
import '../main.dart';
import '../routes.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ApplicationSettings>();
    return BlocBuilder<ApplicationSettings, SettingsState>(
      bloc: bloc,
      builder: (context, state) {
        return BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BottomAppButton(
                  icon: Icons.dashboard,
                  isSelected: bloc.isRouteSelected(ApplicationRoutes.home),
                  selectedColor: primaryColor,
                  onTap: () {
                    if (bloc.currentRoute == ApplicationRoutes.home) {
                      return;
                    }

                    Navigator.popUntil(
                      context,
                      ModalRoute.withName(ApplicationRoutes.home),
                    );
                  },
                ),
                BottomAppButton(
                  icon: Icons.code,
                  isSelected:
                      bloc.isRouteSelected(ApplicationRoutes.setupStart),
                  selectedColor: primaryColor,
                  onTap: () {
                    if (bloc.currentRoute
                        .startsWith(ApplicationRoutes.prefixSetup)) {
                      return;
                    }

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      ApplicationRoutes.setupStart,
                      ModalRoute.withName(ApplicationRoutes.home),
                    );
                  },
                ),
                BottomAppButton(
                  icon: Icons.settings,
                  isSelected: bloc.isRouteSelected(ApplicationRoutes.settings),
                  selectedColor: primaryColor,
                  onTap: () {
                    if (bloc.currentRoute == ApplicationRoutes.settings) {
                      return;
                    }

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      ApplicationRoutes.settings,
                      ModalRoute.withName(ApplicationRoutes.home),
                    );
                  },
                ),
                const Icon(
                  Icons.perm_identity,
                  color: Colors.grey,
                  size: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BottomAppButton extends StatelessWidget {
  const BottomAppButton({
    super.key,
    this.isSelected = false,
    required this.selectedColor,
    required this.icon,
    this.onTap,
  });

  final bool isSelected;
  final Color selectedColor;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: isSelected ? selectedColor : Colors.grey,
        size: 30,
      ),
    );
  }
}
