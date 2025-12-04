import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/ui/routes/widgets_routes/home_routes.dart';

import '../../../application/config/assets_config_language.dart';
import '../../../domain/factories/auth_factory.dart';
import '../../features/auth/config/auth_config.dart';
import '../../features/auth/presentation/args/args.dart';
import '../../features/screens.dart';

class AuthRoutes {
  static LoginScreen getLoginScreen(BuildContext context) {
    return LoginScreen(
      args: LoginArgs(
        language: AssetsConfigLanguage.assetsLanguageLogin,
        config: AuthConfig(
          AuthGatewayFactory(context).authGateway,
        ),
        onLoginSuccess: () => context.pushReplacementNamed(
          HomeScreen.routeName,
        ),
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
        onRegisterSuccess: () => context.pushReplacementNamed(
          HomeScreen.routeName,
        ),
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
        onNewAccountPressed: () => context.pushReplacementNamed(
          RegisterScreen.routeName,
        ),
        onGoogleAuthSuccess: () => context.go(HomeScreen.routeName),
      ),
    );
  }

  static AuthCheckScreen getAuthCheckScreen(BuildContext context) {
    return AuthCheckScreen(
      args: AuthCheckArgs(
        language: AssetsConfigLanguage.assetsLanguageAuthCheck,
        checkSuccess: () => Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                HomeRoutes.getHomeScreen(context),
            transitionDuration: Duration.zero,
          ),
        ),
        checkError: () => Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => getWellcomeScreen(context),
            transitionDuration: Duration.zero,
          ),
        ),
      ),
    );
  }
}
