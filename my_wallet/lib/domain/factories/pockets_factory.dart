import 'package:flutter/material.dart';
import 'package:my_wallet_pockets/domain/gateways/pockets_gateway.dart';

import '../../infrastructure/driven_adapters/repository/home/pockets_api.dart';
import '../../infrastructure/driven_adapters/repository_mock/home/pockets_api_mock.dart';
import '../../ui/current_environment.dart';

class PocketsGatewayFactory {
  factory PocketsGatewayFactory(BuildContext context) {
    if (_instance != null) {
      _instance?._setContext(context);
    }

    return _instance ??= PocketsGatewayFactory._internal(context);
  }

  PocketsGatewayFactory._internal(this.context) {
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
    _pocketsGateway = null;
  }

  BuildContext context;
  late Environment _environment;
  static PocketsGatewayFactory? _instance;
  PocketsGateway? _pocketsGateway;

  PocketsGateway get pocketsGateway =>
      _pocketsGateway ??= _isMock ? PocketsApiMock() : PocketsApi();

  bool get _isMock => _environment == Environment.mock;
}
