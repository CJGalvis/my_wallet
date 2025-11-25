import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/summary_type.dart';
import 'records_provider.dart';

part 'expenses_provider.g.dart';

@riverpod
double expenses(Ref ref) {
  final records = ref.watch(recordsProvider);
  if (records.isEmpty) return 0;
  final balance = records
      .where((a) => a.type == SummaryType.expenses)
      .map((p) => p.value)
      .reduce((a, b) => a + b);
  return balance;
}