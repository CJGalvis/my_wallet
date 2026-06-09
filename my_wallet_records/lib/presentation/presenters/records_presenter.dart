import 'package:my_wallet_core/models/error_item.dart';
import 'package:my_wallet_records/domain/domain.dart';
import 'package:my_wallet_records/presentation/interfaces/records_summary_interface.dart';

import '../../config/pockets_config.dart';

class RecordsPresenter {
  final RecordConfig _config;
  final RecordsSummaryInterface _interface;

  RecordsPresenter(this._interface, this._config);

  void getRecords() async {
    final (ErrorItem?, List<RecordItem>?) response = await _config
        .recordsUseCase
        .getRecords();

    final ErrorItem? error = response.$1;
    final List<RecordItem>? data = response.$2;

    if (error != null) {
      _interface.showError(error);
    }

    if (data != null) {
      _interface.updateData(data);
    }
  }
}
