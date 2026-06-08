import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet_auth/my_wallet_auth.dart';
import 'package:my_wallet_home/my_wallet_home.dart';

import '../../../application/config/assets_config_language.dart';
import '../../../domain/providers/auth_gateway_provider.dart';

class AuthRoutes {
  static LoginScreen getLoginScreen(
    BuildContext context,
    Ref ref,
  ) {
    return LoginScreen(
      args: LoginArgs(
        language: AssetsConfigLanguage.assetsLanguageLogin,
        config: AuthConfig(
          authApi: ref.read(authGatewayProvider),
        ),
        onLoginSuccess: () => context.go(
          HomeScreen.routeName,
        ),
        onNewAccount: () => context.go(
          WellcomeScreen.routeName,
        ),
      ),
    );
  }

  static RegisterScreen getRegisterScreen(
      BuildContext context, Ref ref) {
    return RegisterScreen(
      args: RegisterArgs(
        language: AssetsConfigLanguage.assetsLanguageRegister,
        config: AuthConfig(
          authApi: ref.read(authGatewayProvider),
        ),
        onRegisterSuccess: () => context.go(
          HomeScreen.routeName,
        ),
        onAlreadyAccount: () => context.go(
          LoginScreen.routeName,
        ),
      ),
    );
  }

  static WellcomeScreen getWellcomeScreen(
      BuildContext context, Ref ref) {
    return WellcomeScreen(
      args: WellcomeArgs(
        language: AssetsConfigLanguage.assetsLanguageWellcome,
        config: AuthConfig(
          authApi: ref.read(authGatewayProvider),
        ),
        onLoginPressed: () => context.go(
          LoginScreen.routeName,
        ),
        onNewAccountPressed: () => context.go(
          RegisterScreen.routeName,
        ),
        onGoogleAuthSuccess: () => context.go(HomeScreen.routeName),
      ),
    );
  }

  static AuthCheckScreen getAuthCheckScreen(BuildContext context) {
    return AuthCheckScreen(
      args: AuthCheckArgs(
        checkSuccess: () => context.go(HomeScreen.routeName),
        checkError: () => context.go(WellcomeScreen.routeName),
      ),
    );
  }
}
