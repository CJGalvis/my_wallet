import 'package:my_wallet/ui/features/auth/domain/entities/register_entity.dart';

class RegisterState {
  final bool isLoading;
  final String errorMessage;
  final bool registerSuccess;
  final RegisterEntity registerEntity;

  RegisterState({
    required this.isLoading,
    required this.errorMessage,
    required this.registerSuccess,
    required this.registerEntity,
  });

  factory RegisterState.initial() => RegisterState(
        isLoading: false,
        errorMessage: '',
        registerSuccess: false,
        registerEntity: RegisterEntity.initial(),
      );

  RegisterState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? registerSuccess,
    RegisterEntity? registerEntity,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? '',
      registerSuccess: registerSuccess ?? this.registerSuccess,
      registerEntity: registerEntity ?? this.registerEntity,
    );
  }
}
