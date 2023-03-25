import 'dart:io';

import 'package:awesome_places/src/routes/app_router.dart';
import 'package:awesome_places/src/features/settings/data/themes/application_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const ProviderScope(
    child: AwesomePlacesApp(),
  ));
}

class AwesomePlacesApp extends ConsumerStatefulWidget {
  const AwesomePlacesApp({super.key});
  @override
  ConsumerState<AwesomePlacesApp> createState() => _AwesomePlacesAppState();
}

class _AwesomePlacesAppState extends ConsumerState<AwesomePlacesApp> {
  @override
  Widget build(BuildContext context) {
    final routerWatcher = ref.watch(AppRouter.router);

    return MaterialApp.router(
      title: 'Awesome Places',
      theme: ApplicationThemes.darkTheme(),
      routerDelegate: routerWatcher.routerDelegate,
      routeInformationParser: routerWatcher.routeInformationParser,
      routeInformationProvider: routerWatcher.routeInformationProvider,
    );
  }
}
