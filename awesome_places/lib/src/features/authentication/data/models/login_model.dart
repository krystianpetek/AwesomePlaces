import 'dart:convert';

import 'package:awesome_places/src/features/authentication/data/models/to_json_models.dart';

class LoginModel implements ToJsonModels {
  final String? email;
  final String? password;

  const LoginModel({
    this.email,
    this.password,
  });

  LoginModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  factory LoginModel.initialize() {
    return const LoginModel(email: '', password: '');
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginModel.fromJson(String json) {
    return LoginModel.fromMap(jsonDecode(json) as Map<String, dynamic>);
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
