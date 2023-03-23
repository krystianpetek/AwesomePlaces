import 'package:awesome_places/themes/color_schemes.dart';
import 'package:flutter/material.dart';

class ApplicationThemes {
  // static ThemeData lightTheme() {
  //   return ThemeData(
  //     brightness: Brightness.dark,
  //     fontFamily: 'Georgia',
  //     textTheme: const TextTheme(
  //       displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
  //       titleLarge: TextStyle(
  //         fontSize: 36,
  //         fontStyle: FontStyle.italic,
  //       ),
  //       bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
  //     ),
  //   );
  // }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      // primaryColor: const Color.fromRGBO(58, 58, 250, 1.0),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      // primaryColor: const Color.fromRGBO(58, 58, 250, 1.0),
    );
  }
}
