import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_core/providers/session_provider.dart';
import 'package:my_wallet_pockets/domain/gateways/pockets_gateway.dart';

import '../../infrastructure/driven_adapters/repository/home/pockets_api.dart';
import '../../infrastructure/driven_adapters/repository_mock/pockets/pockets_api_mock.dart';
import '../../ui/current_environment.dart';

final pocketsGatewayProvider = Provider<PocketsGateway>((ref) {
  final sessionNotifier = ref.read(sessionProvider.notifier);

  return CurrentEnvironment.environment == Environment.mock
      ? PocketsApiMock(sessionNotifier: sessionNotifier)
      : PocketsApi(sessionNotifier: sessionNotifier);
});
