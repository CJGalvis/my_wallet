import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_wallet_records/my_wallet_records.dart';

import '../../infrastructure/driven_adapters/repository/records/records_api.dart';
import '../../infrastructure/driven_adapters/repository_mock/records/records_api_mock.dart';
import '../../ui/current_environment.dart';

final recordsGatewayProvider = Provider<RecordsGateway>((ref) {
  // final sessionNotifier = ref.read(sessionProvider.notifier);

  return CurrentEnvironment.environment == Environment.mock
      ? RecordsApiMock()
      : RecordsApi();
});
