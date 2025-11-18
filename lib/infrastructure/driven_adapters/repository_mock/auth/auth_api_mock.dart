
import '../../../../domain/models/error_item.dart';
import '../../../../ui/features/auth/domain/entities/login_entity.dart';
import '../../../../ui/features/auth/domain/entities/register_entity.dart';
import '../../../../ui/features/auth/domain/gateways/auth_gateway.dart';

class AuthApiMock extends AuthGateway {
  @override
  Future<(ErrorItem?, bool)> signIn(
    LoginEntity loginEntity,
  ) async {
    await Future.delayed(Duration(seconds: 3));

    return Future.value(
      (
        ErrorItem(
          code: 999,
          message: 'Login error',
        ),
        false,
      ),
    );
  }

  @override
  Future<(ErrorItem?, bool)> signUp(
    RegisterEntity registerEntity,
  ) async {
    await Future.delayed(Duration(seconds: 3));

    return Future.value((null, false));
  }

  @override
  Future<(ErrorItem?, bool)> signWithGoogle() async {
    await Future.delayed(Duration(seconds: 2));

    return Future.value(
      (
        ErrorItem(
          code: 999,
          message: 'Google error',
        ),
        false,
      ),
    );
  }
}
