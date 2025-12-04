import 'package:user_session_manager/user_session_manager.dart';

import '../../../../domain/models/error_item.dart';
import '../../../../ui/features/auth/domain/entities/login_entity.dart';
import '../../../../ui/features/auth/domain/entities/register_entity.dart';
import '../../../../ui/features/auth/domain/gateways/auth_gateway.dart';
import '../../../firebase/firebase_service.dart';

class AuthApi extends AuthGateway {
  final FirebaseService _firebaseService;
  final SessionManager _sessionManager;

  AuthApi({
    FirebaseService? firebaseService,
    SessionManager? session,
  })  : _firebaseService = firebaseService ?? FirebaseService(),
        _sessionManager = session ?? SessionManager();

  @override
  Future<(ErrorItem?, bool)> signIn(
    LoginEntity loginEntity,
  ) async {
    try {
      final response = await _firebaseService.login(
        loginEntity.email,
        loginEntity.password,
      );

      Map<String, dynamic> user = response.$2 ?? {};

      _sessionManager.saveToken(user['token']);

      _sessionManager.setUserSession(user);

      return (null, true);
    } catch (e) {
      return (
        ErrorItem(
          code: 000,
          message: 'Ocurrió un error en la autenticación',
        ),
        false
      );
    }
  }

  @override
  Future<(ErrorItem?, bool)> signUp(
    RegisterEntity registerEntity,
  ) async {
    try {
      final response = await _firebaseService.register(
        registerEntity.username,
        registerEntity.email,
        registerEntity.password,
      );

      Map<String, dynamic> user = response.$2 ?? {};

      _sessionManager.saveToken(user['token']);

      _sessionManager.setUserSession(user);

      return (null, true);
    } catch (e) {
      return (
        ErrorItem(
          code: 000,
          message: 'Ocurrió un error al intentar hacer el registro',
        ),
        false
      );
    }
  }

  @override
  Future<(ErrorItem?, bool)> signWithGoogle() async {
    try {
      final response = await _firebaseService.googleAuth();

      Map<String, dynamic> user = response.$2 ?? {};

      _sessionManager.saveToken(user['token']);

      _sessionManager.setUserSession(user);

      return (null, true);
    } catch (e) {
      return (
        ErrorItem(message: 'Error al autenticar con google', code: 999),
        false,
      );
    }
  }
}
