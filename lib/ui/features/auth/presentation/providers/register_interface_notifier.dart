import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/register_interface_state.dart';

final registerInterfaceProvider = NotifierProvider<
    RegisterInterfaceNotifier, RegisterInterfaceState>(
  () => RegisterInterfaceNotifier(),
);

class RegisterInterfaceNotifier
    extends Notifier<RegisterInterfaceState> {
  @override
  RegisterInterfaceState build() {
    return RegisterInterfaceState.initial();
  }

  void showLoading() => state = state.copyWith(isLoading: true);

  void hideLoading() => state = state.copyWith(isLoading: false);

  void showError(String message) =>
      state = state.copyWith(errorMessage: message);

  void registerSuccess() =>
      state = state.copyWith(registerSuccess: true);
}
