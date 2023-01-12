import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? data;
  const TextWidget({super.key, this.data});
  @override
  Widget build(BuildContext context) {
    return Text(
      data.toString(),
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }
}
