import 'package:awesome_places/src/features/auth/ui/login_screen.dart';
import 'package:awesome_places/src/features/explore/presentation/explore_screen.dart';
import 'package:awesome_places/src/features/home/presentation/home_screen.dart';
import 'package:awesome_places/src/features/main/presentation/main_screen.dart';
import 'package:awesome_places/src/features/not_found/presentation/not-found_screen.dart';
import 'package:awesome_places/src/features/settings/data/providers/app_settings_provider.dart';
import 'package:awesome_places/src/routes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final router = Provider<GoRouter>((ref) {
    final duplicated = ref.read(appSettingsNotifierProvider);
    // final notifier = ref.read(goRouterNotifierProvider);

    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: Routes.login.path,
      navigatorKey: _rootNavigatorKey,
      // refreshListenable: notifier,
      routes: [
        GoRoute(
          name: Routes.login.name,
          path: Routes.login.path,
          builder: (context, state) => LoginScreen(key: state.pageKey),
        ),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return MainScreen(
              screen: child,
              key: state.pageKey,
            );
          },
          routes: [
            GoRoute(
              name: Routes.home.name,
              path: Routes.home.path,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: HomeScreen(key: state.pageKey),
                );
              },
            ),
            GoRoute(
              name: Routes.explore.name,
              path: Routes.explore.path,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: ExploreScreen(key: state.pageKey),
                );
              },
            ),

            // routing by currentIndex but obsolete
            // GoRoute(
            //   path: Routes.home,
            //   name: 'home',
            //   builder: (context, state) {
            //     final String tab = state.params['tab'] ?? "/";
            //     return MainScreen(
            //       key: state.pageKey,
            //       currentRoute: tab,
            //       title: 'Awesome Places',
            //     );
            //   },
            // ),
          ],
        )
      ],
      errorBuilder: (context, state) => const NotFoundScreen(),
    );
  });
}
