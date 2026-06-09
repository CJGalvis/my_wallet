import 'package:my_wallet_core/models/error_item.dart';
import 'package:my_wallet_records/my_wallet_records.dart';

class RecordsApiMock extends RecordsGateway {
  @override
  Future<(ErrorItem?, List<RecordItem>?)> getRecords() async {
    await Future.delayed(Duration(seconds: 4));

    return Future.value(
      (
        null,
        [
          RecordItem(
            pocket: 'Sueldo',
            value: 120000,
            date: DateTime.now(),
            type: SummaryType.expenses,
            tag: 'Mascota',
          ),
          RecordItem(
            pocket: 'Sueldo',
            value: 200000,
            date: DateTime.now(),
            type: SummaryType.incomes,
            tag: 'Bono',
          ),
        ]
      ),
    );
  }
}
