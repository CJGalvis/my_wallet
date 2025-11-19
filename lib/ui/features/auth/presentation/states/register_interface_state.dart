class RegisterInterfaceState {
  final bool isLoading;
  final String errorMessage;
  final bool registerSuccess;

  RegisterInterfaceState({
    required this.isLoading,
    required this.errorMessage,
    required this.registerSuccess,
  });

  factory RegisterInterfaceState.initial() => RegisterInterfaceState(
        isLoading: false,
        errorMessage: '',
        registerSuccess: false,
      );

  RegisterInterfaceState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? registerSuccess,
  }) {
    return RegisterInterfaceState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? '',
      registerSuccess: registerSuccess ?? this.registerSuccess,
    );
  }
}
