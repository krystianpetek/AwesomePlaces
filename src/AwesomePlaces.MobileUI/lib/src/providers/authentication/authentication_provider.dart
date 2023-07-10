import 'dart:async';
import 'dart:io';

import 'package:awesome_places/src/providers/authentication/enums/authentication_status.dart';
import 'package:awesome_places/src/features/authentication/data/services/app_cache_service.dart';
import 'package:awesome_places/src/features/authentication/data/models/models.dart';
import 'package:awesome_places/src/features/authentication/data/services/authentication_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/authentication_state_model.dart';

final authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationStateModel>(
        (ref) {
  final service = ref.watch(authenticationServiceProvider);
  return AuthenticationNotifier(service);
});

class AuthenticationNotifier extends StateNotifier<AuthenticationStateModel> {
  final AppCacheService _appCache = AppCacheService();
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
        status: AuthenticationStatus.unauthenticated,
        errorMessage: '',
      );
      return;
    }
    final AuthenticationStateModel authenticationState =
        AuthenticationStateModel.fromJson(userState);
    state = authenticationState;
  }

  String? getToken() {
    return state.accessToken;
  }

  Future<void> login(LoginModel login) async {
    try {
      final String? token =
          await authenticationService.login(login: login).timeout(
                const Duration(seconds: 10),
              );

      final AuthenticationStateModel authenticationState =
          AuthenticationStateModel(
        user: '${login.email}',
        accessToken: '$token',
        status: AuthenticationStatus.authenticated,
        errorMessage: '',
      );

      await _appCache.setUser(authenticationState.toJson());
      state = authenticationState;
    } on SocketException {
      String exceptionMessage = 'No connection to internet';
      state = state.copyWith(
        errorMessage: exceptionMessage,
      );
      print(exceptionMessage);
    } on TimeoutException {
      String exceptionMessage = 'Request login execution timeout';
      state = state.copyWith(
        errorMessage: exceptionMessage,
      );
      print(exceptionMessage);
    } on HttpException {
      String exceptionMessage = 'Unable to login, incorrect login data.';
      state = state.copyWith(
        errorMessage: exceptionMessage,
      );
      print(exceptionMessage);
    } on FormatException {
      String exceptionMessage = 'Bad response format';
      state = state.copyWith(
        errorMessage: exceptionMessage,
      );
      print(exceptionMessage);
    } catch (Exception) {
      String exceptionMessage = 'Something went wrong!';
      state = state.copyWith(
        errorMessage: exceptionMessage,
      );
      print(exceptionMessage);
    }
  }

  Future<void> register(RegisterModel register) async {
    try {
      await authenticationService.register(register: register).timeout(
            const Duration(seconds: 10),
          );

      final AuthenticationStateModel authenticationState =
          AuthenticationStateModel(
        user: '',
        accessToken: '',
        status: AuthenticationStatus.unauthenticated,
        errorMessage: '',
      );

      await _appCache.setUser(authenticationState.toJson());
      state = authenticationState;
    } on SocketException {
      String exceptionMessage = 'No connection to internet.';
      state = state.copyWith(
        errorMessage: exceptionMessage,
      );
      print(exceptionMessage);
    } on TimeoutException {
      String exceptionMessage = 'Register execution timeout.';
      state = state.copyWith(
        errorMessage: exceptionMessage,
      );
      print(exceptionMessage);
    } on HttpException {
      String exceptionMessage = 'Unable to register, ensure valid data.';
      state = state.copyWith(
        errorMessage: exceptionMessage,
      );
      print(exceptionMessage);
    } on FormatException {
      String exceptionMessage = 'Bad response format.';
      state = state.copyWith(
        errorMessage: exceptionMessage,
      );
      print(exceptionMessage);
    } catch (Exception) {
      String exceptionMessage = 'Something went wrong!';
      state = state.copyWith(
        errorMessage: exceptionMessage,
      );
      print(exceptionMessage);
    }
  }

  Future<void> logout() async {
    await _appCache.resetUser();
    state = state.copyWith(
      user: '',
      accessToken: '',
      status: AuthenticationStatus.unauthenticated,
      errorMessage: '',
    );
  }
}
