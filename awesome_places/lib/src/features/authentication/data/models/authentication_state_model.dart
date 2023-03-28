import 'dart:convert';

import 'package:awesome_places/src/features/authentication/data/enums/authentication_status.dart';

class AuthenticationStateModel {
  final String user;
  final String accessToken;
  final AuthenticationStatus status;

  AuthenticationStateModel({
    required this.user,
    required this.accessToken,
    this.status = AuthenticationStatus.unuthenticated,
  });

  AuthenticationStateModel copyWith({
    String? user,
    String? accessToken,
    AuthenticationStatus? status,
  }) {
    return AuthenticationStateModel(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
      status: status ?? this.status,
    );
  }

  factory AuthenticationStateModel.initialize() {
    return AuthenticationStateModel(
        status: AuthenticationStatus.unuthenticated, user: '', accessToken: '');
  }

  factory AuthenticationStateModel.fromMap(Map<String, dynamic> map) {
    return AuthenticationStateModel(
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

  factory AuthenticationStateModel.fromJson(String json) {
    return AuthenticationStateModel.fromMap(
        jsonDecode(json) as Map<String, dynamic>);
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
