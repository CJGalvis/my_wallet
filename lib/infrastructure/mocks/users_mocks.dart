import '../../domain/models/user_auth_model.dart';

class UsersMocks {
  static UserAuth getUserAuth() => UserAuth(
        name: 'Fulanito',
        email: 'fulano@mail.com',
        uid: 'uid',
        photo: 'https://avatar.iran.liara.run/public',
      );
}
