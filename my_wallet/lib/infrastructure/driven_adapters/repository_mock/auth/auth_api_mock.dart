import 'package:my_wallet_auth/my_wallet_auth.dart';
import 'package:my_wallet_core/my_wallet_core.dart';

import '../../../mocks/mocks_response.dart';

class AuthApiMock extends AuthGateway {
  final SessionNotifier _sessionManager;

  AuthApiMock({
    required SessionNotifier sessionNotifier,
  }) : _sessionManager = sessionNotifier;

  @override
  Future<(ErrorItem?, bool)> signIn(
    LoginEntity loginEntity,
  ) async {
    await Future.delayed(Duration(seconds: 1));

    final (ErrorItem?, UserAuth?) response =
        await MocksResponse.getAuthMock(loginEntity.email);

    if (response.$2 != null) {
      _sessionManager.saveToken('token123');

      _sessionManager.setUser(response.$2!);

      return (null, true);
    }

    return Future.value(
      (
        response.$1,
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
          title: 'Register error mock',
          description: '',
          category: '',
          retries: true),
      false
    ));
  }

  @override
  Future<(ErrorItem?, bool)> signWithGoogle() async {
    // await Future.delayed(Duration(seconds: 1));

    // final user = UsersMocks.getUserAuth();

    // final userMap = UserAuthMapper().toMap(user);

    // _sessionManager.saveToken(user.email);

    // _sessionManager.setUserSession(userMap);

    return Future.value((
      null,
      true,
    ));
  }
}
