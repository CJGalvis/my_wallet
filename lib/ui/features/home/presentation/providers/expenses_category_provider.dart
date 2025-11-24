import 'package:my_wallet/ui/features/home/domain/models/summary_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/record_item.dart';

part 'expenses_category_provider.g.dart';

@riverpod
class ExpensesCategoryNotifier extends _$ExpensesCategoryNotifier {
  @override
  List<RecordItem> build() {
    return [
      RecordItem(
        type: SummaryType.expenses,
        value: 150000,
        category: 'Comida',
        pocket: 'Nequi',
        date: DateTime.now(),
      ),
      RecordItem(
        type: SummaryType.expenses,
        value: 100000,
        category: 'Vehiculo',
        pocket: 'Nequi',
        date: DateTime.now(),
      ),
    ];
  }
}
