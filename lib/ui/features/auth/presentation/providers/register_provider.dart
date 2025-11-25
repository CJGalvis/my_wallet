import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/register_entity.dart';
import '../states/register_state.dart';

part 'register_provider.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build() => RegisterState.initial();

  void setUsername(String value) {
    state = state.copyWith(
      registerEntity: state.registerEntity.copyWith(username: value),
    );
  }

  void setEmail(String value) {
    state = state.copyWith(
      registerEntity: state.registerEntity.copyWith(email: value),
    );
  }

  void setPassword(String value) {
    state = state.copyWith(
      registerEntity: state.registerEntity.copyWith(password: value),
    );
  }

  void showLoading() => state = state.copyWith(isLoading: true);

  void hideLoading() => state = state.copyWith(isLoading: false);

  void showError(String message) {
    state = state.copyWith(errorMessage: message);
  }

  void registerSuccess() {
    state = state.copyWith(registerSuccess: true);
  }

  void resetError() {
    state = state.copyWith(
      errorMessage: '',
    );
  }

  void resetSuccessFlag() {
    state = state.copyWith(
      registerSuccess: false,
      registerEntity: null,
    );
  }

  RegisterEntity get register => state.registerEntity;
}
