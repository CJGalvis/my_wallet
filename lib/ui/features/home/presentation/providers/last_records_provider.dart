import 'package:flutter/material.dart';
import 'package:my_wallet/ui/features/home/domain/models/summary_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/record_item.dart';

part 'last_records_provider.g.dart';

@riverpod
List<RecordItem> lastRecords(Ref ref) {
  return [
    RecordItem(
      type: SummaryType.incomes,
      icon: Icons.fastfood_rounded,
      pocket: 'Nequi',
      category: 'Mascota',
      value: 120000,
      date: DateTime.now(),
    ),
    RecordItem(
      type: SummaryType.expenses,
      icon: Icons.car_crash,
      pocket: 'Efectivo',
      category: 'Vehiculo',
      value: 200000,
      date: DateTime.now(),
    ),
  ];
}
