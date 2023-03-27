import 'package:awesome_places/src/features/authentication/data/app_cache.dart';
import 'package:awesome_places/src/features/authentication/data/enums/authentication_status.dart';
import 'package:awesome_places/src/features/authentication/data/models/authentication_state.dart';
import 'package:awesome_places/src/features/authentication/data/models/login.dart';
import 'package:awesome_places/src/features/authentication/data/services/authentication_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
  final service = ref.watch(authenticationServiceProvider);
  return AuthenticationNotifier(service);
});

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  final AppCache _appCache = AppCache();
  final IAuthenticationService authenticationService;

  AuthenticationNotifier(this.authenticationService,
      [AuthenticationState? state])
      : super(state ?? AuthenticationState.initialize());

  Future<void> checkAuthenticationStatus() async {
    final String userState = await _appCache.getUser();
    if (userState.isEmpty) {
      state = state.copyWith(
        user: '',
        accessToken: '',
        status: AuthenticationStatus.Unuthenticated,
      );
      return;
    }
    final AuthenticationState authenticationState =
        AuthenticationState.fromJson(userState);
    state = authenticationState;
  }

  Future<void> login(Login login) async {
    try {
      final String? token =
          await authenticationService.login(login: login); // api login

      final AuthenticationState authenticationState = AuthenticationState(
        user: '${login.email}',
        accessToken: '$token',
        status: AuthenticationStatus.Authenticated,
      );

      await _appCache.setUser(authenticationState.toJson());
      state = authenticationState;
    } catch (HttpException) {}
  }

  Future<void> logout() async {
    await _appCache.resetUser();
    state = AuthenticationState(
      user: '',
      accessToken: '',
      status: AuthenticationStatus.Unuthenticated,
    );
  }
}
