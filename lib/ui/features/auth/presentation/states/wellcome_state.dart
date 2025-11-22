class WellcomeState {
  final bool isLoading;
  final String errorMessage;
  final bool signedIn;

  WellcomeState({
    required this.isLoading,
    required this.errorMessage,
    required this.signedIn,
  });

  factory WellcomeState.initial() => WellcomeState(
        isLoading: false,
        errorMessage: '',
        signedIn: false,
      );

  WellcomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? signedIn,
  }) {
    return WellcomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? '',
      signedIn: signedIn ?? this.signedIn,
    );
  }
}
