import 'package:awesome_places/src/features/authentication/data/providers/authentication_provider.dart';
import 'package:awesome_places/src/features/authentication/ui/login_screen.dart';
import 'package:awesome_places/src/features/authentication/ui/register_screen.dart';
import 'package:awesome_places/src/features/authentication/ui/welcome_screen.dart';
import 'package:awesome_places/src/features/explore/presentation/explore_screen.dart';
import 'package:awesome_places/src/features/home/presentation/home_screen.dart';
import 'package:awesome_places/src/features/main/presentation/main_screen.dart';
import 'package:awesome_places/src/features/settings/presentation/settings_screen.dart';
import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RouterChangeNotifier extends AutoDisposeAsyncNotifier<void>
    implements Listenable {
  VoidCallback? routerListener;

  late bool isAuthenticated = false;

  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> build() async {
    isAuthenticated = ref.watch(authenticationProvider).user.isNotEmpty;

    ref.listenSelf((_, __) {
      if (state.isLoading) return;
      routerListener?.call();
    });
  }

  String? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) return null;

    final loggedIn = isAuthenticated;

    final loggingIn = state.subloc == '/login';
    final registeringIn = state.subloc == '/register';
    if (!loggedIn && !loggingIn && registeringIn) return '/register';

    if (!loggedIn) return loggingIn ? null : '/';
    if (loggingIn) return Routes.home.path;
    return null;
  }

  List<RouteBase> get routes => [
        GoRoute(
            name: Routes.welcome.name,
            path: Routes.welcome.path,
            builder: (context, state) => WelcomeScreen(key: state.pageKey),
            routes: [
              GoRoute(
                name: Routes.login.name,
                path: Routes.login.path,
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: LoginScreen(key: state.pageKey),
                  transitionDuration: const Duration(milliseconds: 500),
                  barrierColor: Colors.black54,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    final tween = Tween(begin: 0.0, end: 1.0)
                        .chain(CurveTween(curve: Curves.linear));
                    return ScaleTransition(
                        alignment: Alignment.bottomCenter,
                        scale: animation.drive(tween),
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ));
                  },
                ),
              ),
              GoRoute(
                name: Routes.register.name,
                path: Routes.register.path,
                pageBuilder: (context, state) => CustomTransitionPage(
                  child: RegisterScreen(key: state.pageKey),
                  transitionDuration: const Duration(milliseconds: 500),
                  barrierColor: Colors.black54,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    final tween = Tween(begin: 0.0, end: 1.0)
                        .chain(CurveTween(curve: Curves.easeOut));
                    return SizeTransition(
                      sizeFactor: animation.drive(tween),
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ),
              ),
            ]),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return MainScreen(
              title: 'Awesome Places',
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
            GoRoute(
              name: Routes.settings.name,
              path: Routes.settings.path,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: SettingsScreen(key: state.pageKey),
                );
              },
            )

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
      ];

  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}

final routerChangeNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RouterChangeNotifier, void>(() {
  return RouterChangeNotifier();
});
