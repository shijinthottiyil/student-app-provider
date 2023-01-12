import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  final double? height;
  const SizedBoxWidget({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 15.0,
    );
  }
}
