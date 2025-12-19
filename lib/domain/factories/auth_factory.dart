import 'package:flutter/material.dart';
import 'package:my_wallet_auth/my_wallet_auth.dart';

import '../../infrastructure/driven_adapters/repository/auth/auth_api.dart';
import '../../infrastructure/driven_adapters/repository_mock/auth/auth_api_mock.dart';
import '../../ui/current_environment.dart';

class AuthGatewayFactory {
  factory AuthGatewayFactory(BuildContext context) {
    if (_instance != null) {
      _instance?._setContext(context);
    }

    return _instance ??= AuthGatewayFactory._internal(context);
  }

  AuthGatewayFactory._internal(this.context) {
    _updateEnvironment();
  }

  void _setContext(BuildContext newContext) {
    if (context != newContext) {
      _dispose();
      context = newContext;
      _updateEnvironment();
    }
  }

  void _updateEnvironment() {
    _environment = CurrentEnvironment.environment;
  }

  void _dispose() {
    _authGateway = null;
  }

  BuildContext context;
  late Environment _environment;
  static AuthGatewayFactory? _instance;
  AuthGateway? _authGateway;

  AuthGateway get authGateway =>
      _authGateway ??= _isMock ? AuthApiMock() : AuthApi();

  bool get _isMock => _environment == Environment.mock;
}
