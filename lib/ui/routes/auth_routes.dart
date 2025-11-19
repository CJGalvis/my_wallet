import 'package:flutter/material.dart';
import 'package:my_wallet/domain/factories/auth_factory.dart';
import 'package:provider/provider.dart';

import '../../application/config/assets_config_language.dart';
import '../features/auth/config/auth_config.dart';
import '../features/auth/domain/gateways/auth_gateway.dart';
import '../features/auth/presentation/args/login_args.dart';
import '../features/auth/presentation/args/register_args.dart';
import '../features/auth/presentation/args/wellcome_args.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/wellcome_screen.dart';

class AuthRoutes {
  static LoginScreen getLoginScreen(BuildContext context) {
    return LoginScreen(
      args: LoginArgs(
        language: AssetsConfigLanguage.assetsLanguageLogin,
        config: AuthConfig(
          context.read<AuthGateway>(),
        ),
        onLoginSuccess: () => Navigator.pushReplacementNamed(
          context,
          WellcomeScreen.routeName,
        ),
        onLoginError: (message) {},
        onNewAccount: () => Navigator.pushReplacementNamed(
          context,
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
          Provider.of<AuthGateway>(context, listen: false),
        ),
        onRegisterSuccess: () {},
        onRegisterError: (value) {},
        onAlreadyAccount: () => Navigator.pushReplacementNamed(
          context,
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
        onLoginPressed: () => Navigator.pushReplacementNamed(
          context,
          LoginScreen.routeName,
        ),
        onGoogleAccountPressed: () {},
        onNewAccountPressed: () => Navigator.pushReplacementNamed(
          context,
          RegisterScreen.routeName,
        ),
      ),
    );
  }
}
