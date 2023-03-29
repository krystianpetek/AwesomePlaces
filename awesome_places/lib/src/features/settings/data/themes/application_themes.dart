import 'package:awesome_places/src/features/settings/data/themes/color_schemes.dart';
import 'package:flutter/material.dart';

class ApplicationThemes {
  static ThemeData darkTheme() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        primaryColor: const Color.fromRGBO(58, 58, 250, 1.0),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.white,
            unselectedIconTheme: IconThemeData(color: Colors.blue),
            selectedItemColor: Colors.white));
    // TODO
  }

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      // primaryColor: const Color.fromRGBO(58, 58, 250, 1.0),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(color: Colors.white)),
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
