import 'package:flutter/material.dart';

class TFFWidget extends StatelessWidget {
  final TextCapitalization? textCaps;
  final TextInputType? keyboardType;
  final TextEditingController? textControllers;
  final String? hintText;
  final String? Function(String?)? validator;
  const TFFWidget({
    super.key,
    this.textCaps,
    this.keyboardType,
    this.textControllers,
    this.validator,
    this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCaps ?? TextCapitalization.words,
      keyboardType: keyboardType ?? TextInputType.text,
      controller: textControllers,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        hintText: hintText.toString(),
      ),
      validator: validator,
    );
  }
}
