import 'package:awesome_places/src/features/settings/data/themes/color_schemes.dart';
import 'package:flutter/material.dart';

class ApplicationThemes {
  static ThemeData darkTheme() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        primaryColor: const Color.fromRGBO(58, 58, 250, 1.0),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            backgroundColor: Color(0xFF1C1B1F),
            unselectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(color: Colors.blue),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
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
          backgroundColor: Color.fromRGBO(30, 30, 30, 1),
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(color: Colors.blue),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
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
