import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../application/config/assets_config_language.dart';
import '../../domain/factories/auth_factory.dart';
import '../features/auth/config/auth_config.dart';
import '../features/auth/presentation/args/args.dart';
import '../features/screens.dart';

class AuthRoutes {
  static LoginScreen getLoginScreen(BuildContext context) {
    return LoginScreen(
      args: LoginArgs(
        language: AssetsConfigLanguage.assetsLanguageLogin,
        config: AuthConfig(
          AuthGatewayFactory(context).authGateway,
        ),
        onLoginSuccess: () =>
            context.pushReplacementNamed(WellcomeScreen.routeName),
        onLoginError: (message) {},
        onNewAccount: () => context.pushReplacementNamed(
          WellcomeScreen.routeName,
        ),
      ),
    );
  }

  static RegisterScreen getRegisterScreen(BuildContext context) {
    return RegisterScreen(
      args: RegisterArgs(
        language: AssetsConfigLanguage.assetsLanguageRegister,
        config: AuthConfig(
          AuthGatewayFactory(context).authGateway,
        ),
        onRegisterSuccess: () {},
        onRegisterError: (value) {},
        onAlreadyAccount: () => context.pushReplacementNamed(
          LoginScreen.routeName,
        ),
      ),
    );
  }

  static WellcomeScreen getWellcomeScreen(BuildContext context) {
    return WellcomeScreen(
      args: WellcomeArgs(
        language: AssetsConfigLanguage.assetsLanguageWellcome,
        config: AuthConfig(
          AuthGatewayFactory(context).authGateway,
        ),
        onLoginPressed: () => context.pushReplacementNamed(
          LoginScreen.routeName,
        ),
        onGoogleAccountPressed: () {},
        onNewAccountPressed: () => context.pushReplacementNamed(
          RegisterScreen.routeName,
        ),
      ),
    );
  }
}
