import 'package:flutter/material.dart';
import 'package:my_wallet/ui/features/home/domain/models/summary_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/last_record.dart';

part 'last_records_provider.g.dart';

@riverpod
List<LastRecord> lastRecords(Ref ref) {
  return [
    LastRecord(
      type: SummaryType.incomes,
      icon: Icons.fastfood_rounded,
      pocket: 'Nequi',
      category: 'Mascota',
      value: 120000,
      date: DateTime.now(),
    ),
    LastRecord(
      type: SummaryType.expenses,
      icon: Icons.car_crash,
      pocket: 'Efectivo',
      category: 'Vehiculo',
      value: 200000,
      date: DateTime.now(),
    ),
  ];
}
