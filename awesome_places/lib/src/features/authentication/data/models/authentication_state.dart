import 'dart:convert';

import 'package:awesome_places/src/features/authentication/data/enums/authentication_status.dart';

class AuthenticationState {
  final String user;
  final String accessToken;
  final AuthenticationStatus status;

  AuthenticationState({
    required this.user,
    required this.accessToken,
    this.status = AuthenticationStatus.Unuthenticated,
  });

  AuthenticationState copyWith({
    String? user,
    String? accessToken,
    AuthenticationStatus? status,
  }) {
    return AuthenticationState(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      status: status ?? this.status,
    );
  }

  factory AuthenticationState.initialize() {
    return AuthenticationState(
        status: AuthenticationStatus.Unuthenticated, user: '', accessToken: '');
  }

  factory AuthenticationState.fromMap(Map<String, dynamic> map) {
    return AuthenticationState(
      user: map['user'] as String,
      accessToken: ['accessToken'] as String,
      status: map['authenticationState'] as AuthenticationStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'accessToken': accessToken,
      'status': status.name,
    };
  }

  factory AuthenticationState.fromJson(String json) {
    return AuthenticationState.fromMap(
        jsonDecode(json) as Map<String, dynamic>);
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
