import 'package:awesome_places/src/features/not_found/presentation/not-found_screen.dart';
import 'package:awesome_places/src/routes/models/routes.dart';
import 'package:awesome_places/src/routes/providers/router_change_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider.autoDispose<GoRouter>((ref) {
  final routerChangeNotifier = ref.watch(routerChangeNotifierProvider.notifier);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    refreshListenable: routerChangeNotifier,
    debugLogDiagnostics: true,
    initialLocation: Routes.welcome.path,
    routes: routerChangeNotifier.routes,
    redirect: routerChangeNotifier.redirect,
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});
