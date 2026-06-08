import '../domain/gateways/auth_gateway.dart';
import '../domain/usecases/auth_usecase.dart';

class AuthConfig {
  late AuthUseCase authUseCase;

  AuthConfig({required AuthGateway authApi}) {
    authUseCase = AuthUseCase(authApi);
  }
}
