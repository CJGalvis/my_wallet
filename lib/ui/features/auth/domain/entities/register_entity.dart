class RegisterEntity {
  String username;
  String email;
  String password;

  RegisterEntity({
    required this.username,
    required this.email,
    required this.password,
  });

  factory RegisterEntity.initial() => RegisterEntity(
        username: '',
        email: '',
        password: '',
      );

  RegisterEntity copyWith({
    String? username,
    String? email,
    String? password,
  }) {
    return RegisterEntity(
      username: username ?? this.username,
      email: email ?? this.email,
      password: email ?? this.email,
    );
  }
}
