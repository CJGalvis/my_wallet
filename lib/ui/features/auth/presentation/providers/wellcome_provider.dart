import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../states/wellcome_state.dart';

part 'wellcome_provider.g.dart';

@riverpod
class WellcomeNotifier extends _$WellcomeNotifier {
  @override
  WellcomeState build() => WellcomeState.initial();

  void showLoading() => state = state.copyWith(isLoading: true);

  void hideLoading() => state = state.copyWith(isLoading: false);

  void showError(String message) =>
      state = state.copyWith(errorMessage: message);

  void signSuccess() => state = state.copyWith(signedIn: true);
}
