import '../../domain/entities/login_entity.dart';

class LoginUIState {
  final bool isLoading;
  final String errorMessage;
  final bool loginSuccess;
  final LoginEntity loginEntity;

  LoginUIState({
    required this.isLoading,
    required this.errorMessage,
    required this.loginSuccess,
    required this.loginEntity,
  });

  factory LoginUIState.initial() => LoginUIState(
        isLoading: false,
        errorMessage: '',
        loginSuccess: false,
        loginEntity: LoginEntity(
          email: '',
          password: '',
        ),
      );

  LoginUIState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? loginSuccess,
    LoginEntity? loginEntity,
  }) {
    return LoginUIState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      loginEntity: loginEntity ?? this.loginEntity,
    );
  }
}
