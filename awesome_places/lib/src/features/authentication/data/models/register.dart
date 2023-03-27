class Register {
  final String? email;
  final String? password;
  final String? confirmPassword;

  const Register({
    this.email,
    this.password,
    this.confirmPassword,
  });

  Register copyWith({
    String? email,
    String? password,
    String? passwordConfirm,
  }) {
    return Register(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: passwordConfirm ?? this.confirmPassword,
    );
  }
}
