import '../../domain/models/pocket_model.dart';

class NewPocketState {
  final bool isLoading;
  final String errorMessage;
  final bool registerSuccess;
  final Pocket pocket;

  NewPocketState({
    required this.isLoading,
    required this.errorMessage,
    required this.registerSuccess,
    required this.pocket,
  });

  factory NewPocketState.initial() => NewPocketState(
        isLoading: false,
        errorMessage: '',
        registerSuccess: false,
        pocket: Pocket.initial(),
      );

  NewPocketState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? registerSuccess,
    Pocket? pocket,
  }) {
    return NewPocketState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      registerSuccess: registerSuccess ?? this.registerSuccess,
      pocket: pocket ?? this.pocket,
    );
  }
}
