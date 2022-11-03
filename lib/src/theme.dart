import 'package:flutter/material.dart';

ThemeData getMyTheme() {
  const mainColor = Color(0xff4472C3);

  return ThemeData(
    useMaterial3: true,
    toggleableActiveColor: mainColor,
    colorScheme: const ColorScheme.light(
      primary: mainColor,
    ),
    appBarTheme: const AppBarTheme(
      color: mainColor,
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
      elevation: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}
