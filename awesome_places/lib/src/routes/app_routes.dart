import 'package:awesome_places/src/features/main/presentation/main_screen.dart';
import 'package:awesome_places/src/features/not-found/presentation/not-found_screen.dart';
import 'package:awesome_places/src/routes/constants.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/' + Routes.root,
      routes: [
        GoRoute(
          path: '/' + Routes.root,
          name: Routes.root,
          builder: (context, state) {
            final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
            return MainScreen(
              key: state.pageKey,
              currentTab: tab,
              title: 'Awesome Places',
            );
          },
        ),
      ],
      errorBuilder: (context, state) => NotFoundScreen());
}
