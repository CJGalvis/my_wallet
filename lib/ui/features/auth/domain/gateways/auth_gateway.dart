
import '../../../../../domain/models/error_item.dart';
import '../entities/login_entity.dart';
import '../entities/register_entity.dart';

abstract class AuthGateway {
  Future<(ErrorItem?, bool)> signIn(LoginEntity loginEntity);

  Future<(ErrorItem?, bool)> signUp(RegisterEntity registerEntity);

  Future<(ErrorItem?, bool)> signWithGoogle();
}
