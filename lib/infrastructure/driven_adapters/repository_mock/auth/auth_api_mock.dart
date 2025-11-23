import '../../../../domain/models/error_item.dart';
import '../../../../domain/models/user_auth_model.dart';
import '../../../../ui/features/auth/domain/entities/login_entity.dart';
import '../../../../ui/features/auth/domain/entities/register_entity.dart';
import '../../../../ui/features/auth/domain/gateways/auth_gateway.dart';
import '../../../mocks/users_mocks.dart';

class AuthApiMock extends AuthGateway {
  @override
  Future<(ErrorItem?, UserAuth?)> signIn(
    LoginEntity loginEntity,
  ) async {
    await Future.delayed(Duration(seconds: 3));

    return Future.value(
      (
        ErrorItem(
          code: 999,
          message: 'Login error',
        ),
        null,
      ),
    );
  }

  @override
  Future<(ErrorItem?, UserAuth?)> signUp(
    RegisterEntity registerEntity,
  ) async {
    await Future.delayed(Duration(seconds: 3));

    return Future.value((null, null));
  }

  @override
  Future<(ErrorItem?, UserAuth?)> signWithGoogle() async {
    await Future.delayed(Duration(seconds: 1));

    return Future.value((
      null,
      UsersMocks.getUserAuth(),
    ));
  }
}
