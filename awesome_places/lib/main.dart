import 'package:awesome_places/routes/app_routes.dart';
import 'package:awesome_places/themes/application_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AwesomePlacesApp());
}

class AwesomePlacesApp extends StatefulWidget {
  const AwesomePlacesApp({super.key});
  @override
  State<AwesomePlacesApp> createState() => _AwesomePlacesAppState();
}

class _AwesomePlacesAppState extends State<AwesomePlacesApp> {
  late final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final router = _appRouter.router;

    return MaterialApp.router(
      title: 'Awesome Places',
      theme: ApplicationThemes.darkTheme(),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
