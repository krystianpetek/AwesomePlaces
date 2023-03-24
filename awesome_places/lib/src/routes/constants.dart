import 'package:awesome_places/src/features/not-found/presentation/not-found_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const homeNamedPage = '/home';
  static const homeDetailsNamedPage = 'details';
  static const profileNamedPage = '/profile';
  static const profileDetailsNamedPage = 'details';
  static const settingsNamedPage = '/settings';
  static const exploreNamedPage = '/explore';

  static const String root = 'root';
  static const String home = 'home';
  static const String explore = 'cart';
  static const String settings = 'settings';
  static const String login = 'login';

  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      NotFoundScreen();
}
