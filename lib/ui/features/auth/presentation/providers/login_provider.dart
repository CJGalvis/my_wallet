import 'package:my_wallet/ui/features/auth/domain/entities/login_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../states/login_state.dart';

part 'login_provider.g.dart';

@riverpod
class LoginUI extends _$LoginUI {
  @override
  LoginState build() {
    return LoginState.initial();
  }

  void setEmail(String value) {
    state = state.copyWith(
      loginEntity: state.loginEntity.copyWith(email: value),
    );
  }

  void setPassword(String value) {
    state = state.copyWith(
      loginEntity: state.loginEntity.copyWith(password: value),
    );
  }

  void showLoading() => state = state.copyWith(isLoading: true);

  void hideLoading() => state = state.copyWith(isLoading: false);

  void showError(String message) {
    state = state.copyWith(
      errorMessage: message,
    );
  }

  void loginSuccess() => state = state.copyWith(loginSuccess: true);

  LoginEntity get login => state.loginEntity;
}
