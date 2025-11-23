class UserAuth {
  final String name;
  final String email;
  final String? photo;
  final String uid;

  UserAuth({
    required this.name,
    required this.email,
    required this.uid,
    this.photo,
  });

  factory UserAuth.initial() => UserAuth(
        name: '',
        email: '',
        photo: '',
        uid:'',
      );
}
