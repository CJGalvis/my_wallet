import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/models/user_auth_model.dart';

class SessionState {
  final String token;
  final UserAuth? user;

  const SessionState({this.token = '', this.user});

  SessionState copyWith({String? token, UserAuth? user}) {
    return SessionState(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  bool get isLoggedIn => token.isNotEmpty;
}

final sessionProvider =
    NotifierProvider<SessionNotifier, SessionState>(
      SessionNotifier.new,
    );

class SessionNotifier extends Notifier<SessionState> {
  @override
  SessionState build() {
    return const SessionState();
  }

  void saveToken(String token) {
    state = state.copyWith(token: token);
  }

  String getToken() {
    return state.token;
  }

  void setUser(UserAuth user) {
    state = state.copyWith(user: user);
  }

  UserAuth? getUser() {
    return state.user;
  }

  void clear() {
    state = const SessionState();
  }
}
