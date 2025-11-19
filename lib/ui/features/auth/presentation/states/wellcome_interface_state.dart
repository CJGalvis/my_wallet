class WellcomeInterfaceState {
  final bool isLoading;
  final String errorMessage;
  final bool signedIn;

  WellcomeInterfaceState({
    required this.isLoading,
    required this.errorMessage,
    required this.signedIn,
  });

  factory WellcomeInterfaceState.initial() => WellcomeInterfaceState(
        isLoading: false,
        errorMessage: '',
        signedIn: false,
      );

  WellcomeInterfaceState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? signedIn,
  }) {
    return WellcomeInterfaceState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? '',
      signedIn: signedIn ?? this.signedIn,
    );
  }
}
