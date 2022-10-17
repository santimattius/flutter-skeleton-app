import 'package:flutter/material.dart';

InputDecoration authInputDecoration({
  required BuildContext context,
  required String hintText,
  required String labelText,
  IconData? prefixIcon,
}) {
  final secondary = Theme.of(context).colorScheme.secondary;
  return InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: secondary),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: secondary, width: 2),
    ),
    hintText: hintText,
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.grey),
    prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: secondary) : null,
  );
}
