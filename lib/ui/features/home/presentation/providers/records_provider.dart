import 'package:flutter/material.dart';
import 'package:my_wallet/ui/features/home/domain/models/category_record.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/record_item.dart';
import '../../domain/models/summary_type.dart';

part 'records_provider.g.dart';

@riverpod
class RecordsNotifier extends _$RecordsNotifier {
  @override
  List<RecordItem> build() {
    return [
      RecordItem(
        category: CategoryRecord(
          icon: Icons.account_balance,
          name: 'Salario',
        ),
        date: DateTime.now(),
        pocket: 'Nequi',
        value: 500000,
        type: SummaryType.incomes,
      ),
      RecordItem(
        category: CategoryRecord(
          icon: Icons.car_crash,
          name: 'Vehiculo',
        ),
        date: DateTime.now(),
        pocket: 'Nequi',
        value: 30000,
        type: SummaryType.expenses,
      )
    ];
  }
}
