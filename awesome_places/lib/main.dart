import 'package:awesome_places/screens/main_screen.dart';
import 'package:awesome_places/themes/application_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AwesomePlacesApp());
}

class AwesomePlacesApp extends StatelessWidget {
  const AwesomePlacesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Places',
      theme: ApplicationThemes.darkTheme(),
      home: MainScreen(title: 'Awesome Places'),
    );
  }
}
