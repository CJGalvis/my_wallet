class UserAuth {
  final String name;
  final String email;
  final String? photo;

  UserAuth({
    required this.name,
    required this.email,
    this.photo,
  });

  factory UserAuth.initial() => UserAuth(
        name: '',
        email: '',
        photo: '',
      );
}
