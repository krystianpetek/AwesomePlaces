import 'package:awesome_places/src/features/authentication/data/app_cache.dart';
import 'package:awesome_places/src/features/authentication/data/enums/authentication_status.dart';
import 'package:awesome_places/src/features/authentication/data/models/models.dart';
import 'package:awesome_places/src/features/authentication/data/services/authentication_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationStateModel>(
        (ref) {
  final service = ref.watch(authenticationServiceProvider);
  return AuthenticationNotifier(service);
});

class AuthenticationNotifier extends StateNotifier<AuthenticationStateModel> {
  final AppCache _appCache = AppCache();
  final IAuthenticationService authenticationService;

  AuthenticationNotifier(this.authenticationService,
      [AuthenticationStateModel? state])
      : super(state ?? AuthenticationStateModel.initialize());

  Future<void> checkAuthenticationStatus() async {
    final String userState = await _appCache.getUser();
    if (userState.isEmpty) {
      state = state.copyWith(
        user: '',
        accessToken: '',
        status: AuthenticationStatus.unuthenticated,
      );
      return;
    }
    final AuthenticationStateModel authenticationState =
        AuthenticationStateModel.fromJson(userState);
    state = authenticationState;
  }

  Future<void> login(LoginModel login) async {
    try {
      final String? token =
          await authenticationService.login(login: login); // api login

      final AuthenticationStateModel authenticationState =
          AuthenticationStateModel(
        user: '${login.email}',
        accessToken: '$token',
        status: AuthenticationStatus.authenticated,
      );

      await _appCache.setUser(authenticationState.toJson());
      state = authenticationState;
    } catch (HttpException) {}
  }

  Future<void> logout() async {
    await _appCache.resetUser();
    state = AuthenticationStateModel(
      user: '',
      accessToken: '',
      status: AuthenticationStatus.unuthenticated,
    );
  }
}
