
import '../../../../../domain/models/error_item.dart';
import '../../../../../domain/models/user_auth_model.dart';
import '../entities/login_entity.dart';
import '../entities/register_entity.dart';

abstract class AuthGateway {
  Future<(ErrorItem?, UserAuth?)> signIn(LoginEntity loginEntity);

  Future<(ErrorItem?, UserAuth?)> signUp(RegisterEntity registerEntity);

  Future<(ErrorItem?, bool)> signWithGoogle();
}
