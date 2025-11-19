import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/wellcome_interface_state.dart';

final wellcomeInterfaceProvider = NotifierProvider<
    WellcomeInterfaceNotifier, WellcomeInterfaceState>(
  () => WellcomeInterfaceNotifier(),
);

class WellcomeInterfaceNotifier
    extends Notifier<WellcomeInterfaceState> {
  @override
  WellcomeInterfaceState build() {
    return WellcomeInterfaceState.initial();
  }

  void showLoading() => state = state.copyWith(isLoading: true);

  void hideLoading() => state = state.copyWith(isLoading: false);

  void showError(String message) =>
      state = state.copyWith(errorMessage: message);

  void signSuccess() => state = state.copyWith(signedIn: true);
}
