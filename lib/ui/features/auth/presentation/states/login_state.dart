import '../../../../../domain/models/user_auth_model.dart';
import '../../domain/entities/login_entity.dart';

class LoginState {
  final bool isLoading;
  final String errorMessage;
  final bool loginSuccess;
  final LoginEntity loginEntity;
  final UserAuth userAuth;

  LoginState({
    required this.isLoading,
    required this.errorMessage,
    required this.loginSuccess,
    required this.loginEntity,
    required this.userAuth,
  });

  factory LoginState.initial() => LoginState(
        isLoading: false,
        errorMessage: '',
        loginSuccess: false,
        loginEntity: LoginEntity.initial(),
        userAuth: UserAuth.initial(),
      );

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? loginSuccess,
    LoginEntity? loginEntity,
    UserAuth? userAuth,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      loginEntity: loginEntity ?? this.loginEntity,
      userAuth: userAuth ?? this.userAuth,
    );
  }
}
