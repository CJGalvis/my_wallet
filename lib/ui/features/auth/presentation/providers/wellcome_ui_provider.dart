import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../states/wellcome_ui_state.dart';

part 'wellcome_ui_provider.g.dart';

@riverpod
class WellcomeUI extends _$WellcomeUI {
  @override
  WellcomeUIState build() => WellcomeUIState.initial();

  void showLoading() => state = state.copyWith(isLoading: true);

  void hideLoading() => state = state.copyWith(isLoading: false);

  void showError(String message) =>
      state = state.copyWith(errorMessage: message);

  void signSuccess() => state = state.copyWith(signedIn: true);
}
