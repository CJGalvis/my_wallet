import 'package:my_wallet_auth/my_wallet_auth.dart';
import 'package:my_wallet_core/my_wallet_core.dart';

class AuthApi extends AuthGateway {
  // ignore: unused_field
  final SessionNotifier _sessionNotifier;

  AuthApi({
    required SessionNotifier sessionNotifier,
  }) : _sessionNotifier = sessionNotifier;
  
  @override
  Future<(ErrorItem?, bool)> signIn(LoginEntity loginEntity) {
    throw UnimplementedError();
  }
  
  @override
  Future<(ErrorItem?, bool)> signUp(RegisterEntity registerEntity) {
    throw UnimplementedError();
  }
  
  @override
  Future<(ErrorItem?, bool)> signWithGoogle() {
    throw UnimplementedError();
  }
}
