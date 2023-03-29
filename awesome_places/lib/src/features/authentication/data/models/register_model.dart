import 'dart:convert';

import 'package:awesome_places/src/features/authentication/data/models/to_json_models.dart';

class RegisterModel implements ToJsonModels {
  final String? email;
  final String? password;
  final String? confirmPassword;

  const RegisterModel({
    this.email,
    this.password,
    this.confirmPassword,
  });

  RegisterModel copyWith({
    String? email,
    String? password,
    String? passwordConfirm,
  }) {
    return RegisterModel(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: passwordConfirm ?? confirmPassword,
    );
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      email: map['email'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword
    };
  }

  factory RegisterModel.fromJson(String json) {
    return RegisterModel.fromMap(jsonDecode(json) as Map<String, dynamic>);
  }

  @override
  String toJson() {
    return jsonEncode(toMap());
  }
}
