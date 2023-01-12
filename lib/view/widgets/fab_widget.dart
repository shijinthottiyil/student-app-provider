import 'package:flutter/material.dart';

class FabWidget extends StatelessWidget {
  final VoidCallback? onPressedFunction;
  final IconData? icon;
  const FabWidget({super.key, this.onPressedFunction, this.icon});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressedFunction,
      backgroundColor: const Color.fromARGB(255, 9, 7, 14),
      child: Icon(
        icon,
      ),
    );
  }
}
