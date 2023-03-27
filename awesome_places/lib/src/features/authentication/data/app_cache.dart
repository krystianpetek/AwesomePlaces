import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  Future<void> resetUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userState', '');
  }

  Future<void> setUser(String userState) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userState', userState);
  }

  Future<String> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userState') ?? '';
  }
}
