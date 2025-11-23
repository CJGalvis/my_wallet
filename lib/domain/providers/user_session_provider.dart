import 'package:my_wallet/domain/models/user_auth_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_session_provider.g.dart';

@riverpod
class UserSessionNotifier extends _$UserSessionNotifier {
  @override
  UserAuth build() {
    return UserAuth.initial();
  }

  void setUserSession(UserAuth user) {
    state = user;
  }
}
