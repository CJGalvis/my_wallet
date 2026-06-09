import 'package:my_wallet_core/models/error_item.dart';
import 'package:my_wallet_records/my_wallet_records.dart';

class RecordsApi extends RecordsGateway {
  @override
  Future<(ErrorItem?, List<RecordItem>?)> getRecords() {
    // TODO: implement getRecords
    throw UnimplementedError();
  }
}