import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  Future<void> invalidate() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', '');
  }

  Future<void> cacheUser(String user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user);
  }

  Future<String?> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }
}
