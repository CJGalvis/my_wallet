import 'package:my_wallet_core/models/error_item.dart';
import 'package:my_wallet_records/domain/models/models.dart';

abstract class RecordsSummaryInterface {
  void updateData(List<RecordItem> records);
  void showError(ErrorItem error);
}
