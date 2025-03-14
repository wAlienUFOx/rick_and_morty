import 'package:flutter/material.dart';
import 'custom_theme.dart';

class TextsTheme {
  const TextsTheme._();

  static TextsTheme get light => const TextsTheme._();

  static TextsTheme of(BuildContext context) {
    final themeColor = CustomTheme.of(context);
    switch (themeColor.theme) {
      default:
        return light;
    }
  }

  TextStyle heading(Color color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      fontSize: 26,
    );
  }

  TextStyle heading2(Color color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      fontSize: 23,
    );
  }

  TextStyle body(Color color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 15,
      letterSpacing: 0,
    );
  }

  TextStyle label(Color color) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 0,
    );
  }
}
