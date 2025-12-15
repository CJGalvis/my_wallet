import 'package:my_wallet/ui/features/home/domain/models/summary_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/record_item.dart';

part 'records_provider.g.dart';

@riverpod
class RecordsNotifier extends _$RecordsNotifier {
  @override
  List<RecordItem> build() {
    return [
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
    ];
  }
}
