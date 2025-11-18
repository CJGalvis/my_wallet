
import '../domain/gateways/auth_gateway.dart';
import '../domain/usecases/auth_usecase.dart';

class AuthConfig {
  final AuthGateway _authApi;
  late AuthUseCase authUseCase;

  AuthConfig(this._authApi) {
    authUseCase = AuthUseCase(_authApi);
  }
}
