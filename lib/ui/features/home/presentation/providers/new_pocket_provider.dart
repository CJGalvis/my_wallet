import 'package:my_wallet/ui/features/home/domain/models/pocket_model.dart';
import 'package:my_wallet/ui/features/home/domain/models/pocket_type.dart';
import 'package:my_wallet/ui/features/home/presentation/states/new_pocket_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_pocket_provider.g.dart';

@riverpod
class NewPocketNotifier extends _$NewPocketNotifier {
  @override
  NewPocketState build() {
    return NewPocketState.initial();
  }

  void setType(PocketType value) {
    state = state.copyWith(
      pocket: state.pocket.copyWith(type: value),
    );
  }

  void setName(String value) {
    state = state.copyWith(
      pocket: state.pocket.copyWith(name: value),
    );
  }

  void setBalance(double value) {
    state = state.copyWith(
      pocket: state.pocket.copyWith(balance: value),
    );
  }

  void isLoading() => state = state.copyWith(isLoading: true);

  void hideLoading() => state = state.copyWith(isLoading: false);

  void showError(String message) =>
      state = state.copyWith(errorMessage: message);

  void createdSuccess(Pocket item) {
    state = state.copyWith(registerSuccess: true, pocket: item);
  }

  void resetSuccessFlag() {
    state = state.copyWith(registerSuccess: false);
  }

  Pocket get pocket => state.pocket;
}
