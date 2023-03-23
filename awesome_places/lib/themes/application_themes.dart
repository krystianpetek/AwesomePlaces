import 'package:awesome_places/themes/color_schemes.dart';
import 'package:flutter/material.dart';

class ApplicationThemes {
  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      // primaryColor: const Color.fromRGBO(58, 58, 250, 1.0),
    );
    // TODO
  }

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      // primaryColor: const Color.fromRGBO(58, 58, 250, 1.0),
    );
    // TODO
  }

  static TextTheme customTextTheme = const TextTheme(
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    // TODO
  );
}
