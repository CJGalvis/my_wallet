import '../../../../../domain/models/user_auth_model.dart';

class WellcomeState {
  final bool isLoading;
  final String errorMessage;
  final bool signedIn;
  final UserAuth userAuth;

  WellcomeState({
    required this.isLoading,
    required this.errorMessage,
    required this.signedIn,
    required this.userAuth,
  });

  factory WellcomeState.initial() => WellcomeState(
        isLoading: false,
        errorMessage: '',
        signedIn: false,
        userAuth: UserAuth.initial(),
      );

  WellcomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? signedIn,
    UserAuth? userAuth,
  }) {
    return WellcomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? '',
      signedIn: signedIn ?? this.signedIn,
      userAuth: userAuth ?? this.userAuth,
    );
  }
}
