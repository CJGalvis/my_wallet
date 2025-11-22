import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../states/login_ui_state.dart';

part 'login_ui_provider.g.dart';

@riverpod
class LoginUI extends _$LoginUI {
  @override
  LoginUIState build() => LoginUIState.initial();

  void showLoading() => state = state.copyWith(isLoading: true);

  void hideLoading() => state = state.copyWith(isLoading: false);

  void showError(String message) => state = state.copyWith(
        errorMessage: message,
      );

  void loginSuccess() => state = state.copyWith(loginSuccess: true);
}
