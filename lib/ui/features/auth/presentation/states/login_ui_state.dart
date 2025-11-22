class LoginUIState {
  final bool isLoading;
  final String errorMessage;
  final bool loginSuccess;

  LoginUIState({
    required this.isLoading,
    required this.errorMessage,
    required this.loginSuccess,
  });

  factory LoginUIState.initial() => LoginUIState(
        isLoading: false,
        errorMessage: '',
        loginSuccess: false,
      );

  LoginUIState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? loginSuccess,
  }) {
    return LoginUIState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      loginSuccess: loginSuccess ?? this.loginSuccess,
    );
  }
}
