import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback? onPressedFn;
  final IconData? iconData;
  final String? data;
  const ElevatedButtonWidget({
    super.key,
    this.onPressedFn,
    this.iconData,
    this.data,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 20,
        backgroundColor: Colors.black,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30.0,
          ),
        ),
      ),
      onPressed: onPressedFn,
      icon: Icon(iconData),
      label: Text(
        data.toString(),
      ),
    );
  }
}
