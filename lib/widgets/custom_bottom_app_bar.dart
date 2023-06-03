import 'package:flutter/material.dart';

import '../main.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.label_outline,
              size: 35,
              color: primaryColor,
            ),
            const Icon(
              Icons.ac_unit,
              color: Colors.grey,
              size: 30,
            ),
            const Icon(
              Icons.tune,
              size: 30,
              color: Colors.grey,
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
  }
}
