import 'package:my_wallet_core/models/user_auth_model.dart';
class UsersMocks {
  static UserAuth getUserAuth() => UserAuth(
        name: 'Fulanito',
        email: 'fulano@mail.com',
        photo: 'https://avatar.iran.liara.run/public',
      );
}
