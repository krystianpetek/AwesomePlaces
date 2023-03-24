import 'package:awesome_places/src/features/explore/presentation/explore_screen.dart';
import 'package:awesome_places/src/features/home/presentation/home_screen.dart';
import 'package:awesome_places/src/features/main/presentation/main_screen.dart';
import 'package:awesome_places/src/features/not_found/presentation/not-found_screen.dart';
import 'package:awesome_places/src/features/settings/data/providers/route_provider.dart';
import 'package:awesome_places/src/routes/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final router = Provider<GoRouter>((ref) {
    final notifier = ref.read(goRouterNotifierProvider);

    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: Routes.home,
      navigatorKey: _rootNavigatorKey,
      refreshListenable: notifier,
      routes: [
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
              path: Routes.home,
              name: 'home',
              pageBuilder: (context, state) {
                return NoTransitionPage(child: HomeScreen(key: state.pageKey));
              },
            ),
            GoRoute(
              path: Routes.explore,
              name: 'explore',
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    child: ExploreScreen(key: state.pageKey));
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
