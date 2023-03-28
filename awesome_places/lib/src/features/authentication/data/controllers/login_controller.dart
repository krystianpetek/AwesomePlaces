import 'package:awesome_places/src/features/authentication/data/models/login_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardControllerProvider =
    StateNotifierProvider<LoginController, LoginModel>((ref) {
  return LoginController(LoginModel.initialize());
});

class LoginController extends StateNotifier<LoginModel> {
  LoginController(super.state);

  void setState(LoginModel loginModel) {
    state = loginModel;
  }
}
