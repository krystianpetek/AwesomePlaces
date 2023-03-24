import 'package:awesome_places/src/features/not_found/presentation/not-found_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String root = '/';
  static const String home = '/home';
  static const String homeDetails = 'details';
  static const String profile = '/profile';
  static const String profileDetails = 'details';
  static const String settings = '/settings';
  static const String login = '/login';
  static const String explore = '/explore';
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const NotFoundScreen();
}
