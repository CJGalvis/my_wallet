import 'package:api_http_client/api_http_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_session_manager/user_session_manager.dart';

import '../../../../domain/models/error_item.dart';
import '../../../../ui/features/auth/domain/entities/login_entity.dart';
import '../../../../ui/features/auth/domain/entities/register_entity.dart';
import '../../../../ui/features/auth/domain/gateways/auth_gateway.dart';
import '../../../firebase/google_auth_service.dart';
import '../../../helpers/auth_endpoints.dart';

class AuthApi extends AuthGateway {
  final GoogleAuthService _googleAuthService;
  final SessionManager _session;
  final HttpClient _apiClient;

  AuthApi({
    GoogleAuthService? googleAuthService,
    SessionManager? session,
    HttpClient? client,
  })  : _googleAuthService = googleAuthService ?? GoogleAuthService(),
        _session = session ?? SessionManager(),
        _apiClient = client ??
            HttpClient(
              HttpConfig(
                baseUrl: AuthEndpoints.firebaseAuthBaseUrl,
                tokenProvider: () async =>
                    await (session ?? SessionManager()).getToken(),
                onUnauthorized: () async {
                  await (session ?? SessionManager())
                      .handleUnauthorized();
                },
              ),
            );

  @override
  Future<(ErrorItem?, bool)> signIn(
    LoginEntity loginEntity,
  ) async {
    await Future.delayed(Duration(seconds: 3));

    return Future.value((null, true));
  }

  @override
  Future<(ErrorItem?, bool)> signUp(
    RegisterEntity registerEntity,
  ) async {
    await Future.delayed(Duration(seconds: 3));

    return Future.value((null, true));
  }

  @override
  Future<(ErrorItem?, bool)> signWithGoogle() async {
    try {
      User? user = await _googleAuthService.signInWithGoogle();

      if (user == null) {
        return (
          ErrorItem(message: "Google sign-in cancelled", code: 001),
          false
        );
      }
      
      final String? token = await user.getIdToken();
      _session.saveToken(token ?? '');

      return (null, true);
    } catch (e) {
      return (
        ErrorItem(message: e.toString(), code: 999),
        false,
      );
    }
  }
}
