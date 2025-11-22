class RegisterUIState {
  final bool isLoading;
  final String errorMessage;
  final bool registerSuccess;

  RegisterUIState({
    required this.isLoading,
    required this.errorMessage,
    required this.registerSuccess,
  });

  factory RegisterUIState.initial() => RegisterUIState(
        isLoading: false,
        errorMessage: '',
        registerSuccess: false,
      );

  RegisterUIState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? registerSuccess,
  }) {
    return RegisterUIState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? '',
      registerSuccess: registerSuccess ?? this.registerSuccess,
    );
  }
}
