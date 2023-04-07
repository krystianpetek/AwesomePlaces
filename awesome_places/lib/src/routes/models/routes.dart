import 'package:awesome_places/src/features/not_found/presentation/not-found_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const RouteModel welcome = RouteModel(
    name: 'welcome',
    path: '/',
  );
  static const RouteModel login = RouteModel(
    name: 'login',
    path: 'login',
  );
  static const RouteModel register = RouteModel(
    name: 'register',
    path: 'register',
  );
  static const RouteModel onboarding = RouteModel(
    name: 'onboard',
    path: '/onboard',
  );
  static const RouteModel home = RouteModel(
    name: 'home',
    path: '/home',
  );
  static const RouteModel explore = RouteModel(
    name: 'explore',
    path: '/explore',
  );
  static const RouteModel search = RouteModel(
    name: 'search',
    path: '/search',
  );
  static const RouteModel profile = RouteModel(
    name: 'profile',
    path: '/profile',
  );
  static const RouteModel placeFullScreen = RouteModel(
    name: 'placeFullScreen',
    path: 'placeFullScreen',
  );
  // static const RouteModel placeGrid = RouteModel(
  //   name: 'placeGrid',
  //   path: 'placeGrid',
  // );
  // static const RouteModel placeList = RouteModel(
  //   name: 'placeList',
  //   path: 'placeList',
  // );
  static const RouteModel place = RouteModel(
    name: 'place',
    path: 'place',
  );
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const NotFoundScreen();
}

class RouteModel {
  final String path;
  final String name;
  const RouteModel({required this.name, required this.path});
}
