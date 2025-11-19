import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/login_interface_state.dart';

final loginInterfaceProvider =
    NotifierProvider<LoginInterfaceNotifier, LoginInterfaceState>(
  () => LoginInterfaceNotifier(),
);

class LoginInterfaceNotifier extends Notifier<LoginInterfaceState> {
  @override
  LoginInterfaceState build() {
    return LoginInterfaceState.initial();
  }

  void showLoading() => state = state.copyWith(isLoading: true);

  void hideLoading() => state = state.copyWith(isLoading: false);

  void showError(String message) =>
      state = state.copyWith(errorMessage: message);

  void loginSuccess() => state = state.copyWith(loginSuccess: true);
}
