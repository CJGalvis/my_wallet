import '../../domain/entities/login_entity.dart';

class LoginState {
  final bool isLoading;
  final String errorMessage;
  final bool loginSuccess;
  final LoginEntity loginEntity;

  LoginState({
    required this.isLoading,
    required this.errorMessage,
    required this.loginSuccess,
    required this.loginEntity,
  });

  factory LoginState.initial() => LoginState(
        isLoading: false,
        errorMessage: '',
        loginSuccess: false,
        loginEntity: LoginEntity.initial(),
      );

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? loginSuccess,
    LoginEntity? loginEntity,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      loginEntity: loginEntity ?? this.loginEntity,
    );
  }
}
