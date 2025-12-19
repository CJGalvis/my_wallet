import 'package:my_wallet_auth/my_wallet_auth.dart';
import 'package:my_wallet_core/my_wallet_core.dart';
import 'package:user_session_manager/user_session_manager.dart';

import '../../../mocks/users_mocks.dart';

class AuthApiMock extends AuthGateway {
  final SessionManager _sessionManager;

  AuthApiMock({
    SessionManager? session,
  }) : _sessionManager = session ?? SessionManager();

  @override
  Future<(ErrorItem?, bool)> signIn(
    LoginEntity loginEntity,
  ) async {
    await Future.delayed(Duration(seconds: 1));

    return Future.value(
      (
        ErrorItem(
          code: 999,
          message: 'Login error mock',
          description: '',
        ),
        false,
      ),
    );
  }

  @override
  Future<(ErrorItem?, bool)> signUp(
    RegisterEntity registerEntity,
  ) async {
    await Future.delayed(Duration(seconds: 1));

    return Future.value((
      ErrorItem(
        code: 999,
        message: 'Register error mock',
        description: '',
      ),
      false
    ));
  }

  @override
  Future<(ErrorItem?, bool)> signWithGoogle() async {
    await Future.delayed(Duration(seconds: 1));

    final user = UsersMocks.getUserAuth();

    final userMap = UserAuthMapper().toMap(user);

    _sessionManager.saveToken(user.email);

    _sessionManager.setUserSession(userMap);

    return Future.value((
      null,
      true,
    ));
  }
}
