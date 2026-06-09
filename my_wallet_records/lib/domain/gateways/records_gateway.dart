


import 'package:my_wallet_core/models/error_item.dart';
import 'package:my_wallet_records/domain/domain.dart';

abstract class RecordsGateway {
  Future<(ErrorItem?, List<RecordItem>?)> getRecords();
}
