import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle appBarTitle(ColorScheme color) => TextStyle(
    color: color.onPrimary,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bodyMedium(ColorScheme color) =>
      TextStyle(fontWeight: FontWeight.bold);

  static TextStyle elevatedButton(ColorScheme color) =>
      TextStyle(color: color.onSecondary, fontWeight: FontWeight.bold);
}
