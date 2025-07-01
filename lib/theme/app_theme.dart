import 'package:flutter/material.dart';
import 'color_schemes.dart';
import 'text_styles.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: kLightColorScheme,
  scaffoldBackgroundColor: kLightColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: kLightColorScheme.primary,
    titleTextStyle: TextStyles.appBarTitle(kLightColorScheme),
    actionsIconTheme: IconThemeData(
      color: kLightColorScheme.onPrimary,
    ),
  ),
  cardTheme: CardThemeData(
    color: kLightColorScheme.surface,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: kLightColorScheme.onSurface,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: IconThemeData(color: kLightColorScheme.secondary),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kLightColorScheme.secondary,
      foregroundColor: kLightColorScheme.onSecondary,
      textStyle: TextStyles.elevatedButton(kLightColorScheme),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: kDarkColorScheme,
  scaffoldBackgroundColor: kDarkColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: kDarkColorScheme.primary,
    titleTextStyle: TextStyles.appBarTitle(kDarkColorScheme),
    actionsIconTheme: IconThemeData(
      color: kDarkColorScheme.onPrimary,
    ),
  ),
  cardTheme: CardThemeData(
    color: kDarkColorScheme.primary.withValues(alpha: 0.4),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyles.bodyMedium(kDarkColorScheme),
  ),
  iconTheme: IconThemeData(color: kDarkColorScheme.secondary),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kDarkColorScheme.secondary,
      foregroundColor: kDarkColorScheme.onSecondary,
      textStyle: TextStyles.elevatedButton(kDarkColorScheme),
    ),
  ),
);
