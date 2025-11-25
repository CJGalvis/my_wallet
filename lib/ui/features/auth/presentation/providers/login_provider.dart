import 'package:my_wallet/ui/features/auth/domain/entities/login_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/models/user_auth_model.dart';
import '../states/login_state.dart';

part 'login_provider.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
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

  void clearError() {
    state = state.copyWith(
      errorMessage: '',
    );
  }

  void loginSuccess(UserAuth userAuth) {
    state = state.copyWith(
      loginSuccess: true,
      userAuth: userAuth,
    );
  }

  LoginEntity get login => state.loginEntity;
}
