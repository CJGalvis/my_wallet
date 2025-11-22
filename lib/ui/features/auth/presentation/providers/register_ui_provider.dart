import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../states/register_ui_state.dart';

part 'register_ui_provider.g.dart';

@riverpod
class RegiterUI extends _$RegiterUI {
  @override
  RegisterUIState build() => RegisterUIState.initial();

  void showLoading() => state = state.copyWith(isLoading: true);

  void hideLoading() => state = state.copyWith(isLoading: false);

  void showError(String message) =>
      state = state.copyWith(errorMessage: message);

  void registerSuccess() =>
      state = state.copyWith(registerSuccess: true);
}
