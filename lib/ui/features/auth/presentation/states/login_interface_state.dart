class LoginInterfaceState {
  final bool isLoading;
  final String errorMessage;
  final bool loginSuccess;

  LoginInterfaceState({
    required this.isLoading,
    required this.errorMessage,
    required this.loginSuccess,
  });

  factory LoginInterfaceState.initial() => LoginInterfaceState(
        isLoading: false,
        errorMessage: '',
        loginSuccess: false,
      );

  LoginInterfaceState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? loginSuccess,
  }) {
    return LoginInterfaceState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? '',
      loginSuccess: loginSuccess ?? this.loginSuccess,
    );
  }
}
