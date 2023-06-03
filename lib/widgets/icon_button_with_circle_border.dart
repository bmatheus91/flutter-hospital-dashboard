import 'package:flutter/material.dart';

class IconButtonWithCircleBorder extends StatelessWidget {
  const IconButtonWithCircleBorder({
    super.key,
    required this.child,
    required this.borderColor,
    this.onTap,
  });

  final Widget child;
  final Color borderColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(color: Colors.white, width: 1),
          ),
        ),
        child: child,
      ),
    );
  }
}
