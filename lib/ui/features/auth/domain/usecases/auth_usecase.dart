import '../../../../../domain/models/error_item.dart';
import '../../../../../domain/models/user_auth_model.dart';
import '../entities/login_entity.dart';
import '../entities/register_entity.dart';
import '../gateways/auth_gateway.dart';

class AuthUseCase {
  final AuthGateway _authGateway;

  AuthUseCase(this._authGateway);

  Future<(ErrorItem?, bool)> signIn(LoginEntity loginEntity) {
    return _authGateway.signIn(loginEntity);
  }

  Future<(ErrorItem?, UserAuth?)> signUp(
      RegisterEntity registerEntity) {
    return _authGateway.signUp(registerEntity);
  }

  Future<(ErrorItem?, bool)> signWithGoogle() {
    return _authGateway.signWithGoogle();
  }
}
