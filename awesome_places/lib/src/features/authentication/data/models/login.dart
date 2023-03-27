import 'dart:convert';

class Login {
  final String? email;
  final String? password;

  const Login({
    this.email,
    this.password,
  });

  Login copyWith({
    String? email,
    String? password,
  }) {
    return Login(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
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

  factory Login.fromJson(String json) {
    return Login.fromMap(jsonDecode(json) as Map<String, dynamic>);
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
