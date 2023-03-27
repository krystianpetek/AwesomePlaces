import 'package:awesome_places/src/features/authentication/data/app_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider = Provider<AuthNotifier>((ref) => AuthNotifier());

class AuthNotifier extends ChangeNotifier {
  bool _loggedIn = false;
  final AppCache _appCache = AppCache();

  bool get isLoggedIn => _loggedIn;

  Future<void> initializeApp() async {
    String? username = await _appCache.isUserLoggedIn();
    if (username != null && username.isNotEmpty) _loggedIn = true;
  }

  Future<void> login(String username, String password) async {
    _loggedIn = true;
    await _appCache.cacheUser(username);
    notifyListeners();
  }

  Future<void> logout() async {
    _loggedIn = false;

    await _appCache.invalidate();
    await initializeApp();
    notifyListeners();
  }
}
