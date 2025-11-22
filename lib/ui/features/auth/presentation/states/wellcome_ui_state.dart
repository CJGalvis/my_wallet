class WellcomeUIState {
  final bool isLoading;
  final String errorMessage;
  final bool signedIn;

  WellcomeUIState({
    required this.isLoading,
    required this.errorMessage,
    required this.signedIn,
  });

  factory WellcomeUIState.initial() => WellcomeUIState(
        isLoading: false,
        errorMessage: '',
        signedIn: false,
      );

  WellcomeUIState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? signedIn,
  }) {
    return WellcomeUIState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? '',
      signedIn: signedIn ?? this.signedIn,
    );
  }
}
