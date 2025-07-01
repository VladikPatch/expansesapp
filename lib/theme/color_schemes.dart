import 'package:flutter/material.dart';

const Color kLightSeedColor = Color(0xFFCC2B52);
const Color kDartSeedColor = Color(0xFF393E46);

final ColorScheme kLightColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: kLightSeedColor,
);

final ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: kDartSeedColor,
);
