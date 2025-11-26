import 'dart:convert';

import 'package:user_session_manager/user_session_manager.dart';

import '../../../../domain/mappers/user_auth_mapper.dart';
import '../../../../domain/models/error_item.dart';
import '../../../../domain/models/user_auth_model.dart';
import '../../../../ui/features/auth/domain/entities/login_entity.dart';
import '../../../../ui/features/auth/domain/entities/register_entity.dart';
import '../../../../ui/features/auth/domain/gateways/auth_gateway.dart';
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
        ),
        false,
      ),
    );
  }

  @override
  Future<(ErrorItem?, UserAuth?)> signUp(
    RegisterEntity registerEntity,
  ) async {
    await Future.delayed(Duration(seconds: 3));

    return Future.value((
      ErrorItem(
        code: 999,
        message: 'Register error mock',
      ),
      null
    ));
  }

  @override
  Future<(ErrorItem?, bool)> signWithGoogle() async {
    await Future.delayed(Duration(seconds: 1));

    final user = UsersMocks.getUserAuth();

    final userMap = UserAuthMapper().toMap(user);

    _sessionManager.setUserSession(json.encode(userMap));

    return Future.value((
      null,
      true,
    ));
  }
}
