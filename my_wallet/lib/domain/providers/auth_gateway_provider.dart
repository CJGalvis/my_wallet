import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet/infrastructure/driven_adapters/repository/auth/auth_api.dart';
import 'package:my_wallet/infrastructure/driven_adapters/repository_mock/auth/auth_api_mock.dart';
import 'package:my_wallet/ui/current_environment.dart';
import 'package:my_wallet_auth/domain/gateways/auth_gateway.dart';
import 'package:my_wallet_core/providers/session_provider.dart';

final authGatewayProvider = Provider<AuthGateway>((ref) {
  final sessionNotifier = ref.read(sessionProvider.notifier);

  return CurrentEnvironment.environment == Environment.mock
      ? AuthApiMock(sessionNotifier: sessionNotifier)
      : AuthApi(sessionNotifier: sessionNotifier);
});
