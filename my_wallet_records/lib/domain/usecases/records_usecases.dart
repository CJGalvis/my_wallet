import 'package:my_wallet_core/models/error_item.dart';
import 'package:my_wallet_records/domain/models/record_item.dart';

import '../gateways/records_gateway.dart';

class RecordsUseCase {
  final RecordsGateway _recordsGateway;

  RecordsUseCase(this._recordsGateway);

  Future<(ErrorItem?, List<RecordItem>?)> getRecords() {
    return _recordsGateway.getRecords();
  }
}
