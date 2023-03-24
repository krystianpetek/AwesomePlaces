import 'package:awesome_places/src/routes/app_routes.dart';
import 'package:awesome_places/src/features/settings/data/themes/application_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
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
