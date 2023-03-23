import 'package:awesome_places/screens/home_screen.dart';
import 'package:awesome_places/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/:tab',
    routes: [
      GoRoute(
        path: '/:tab',
        name: 'main',
        builder: (context, state) {
          final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
          return MainScreen(
            key: state.pageKey,
            currentTab: tab,
            title: 'Awesome Places',
          );
        },
      )
    ],
  );
}
